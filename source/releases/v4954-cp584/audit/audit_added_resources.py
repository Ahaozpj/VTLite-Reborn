#!/usr/bin/env python3
"""Audit added resource identities and SDK R field mappings, without exporting payloads.
Requires the adjacent existing audit_resource_table.py and audit_resources.py.
The dependency manifest describes historical provenance, not binary AAR equivalence.
"""
import argparse, collections, json, re, subprocess, tempfile, zipfile
from pathlib import Path
from audit_resource_table import parse, BASE, TARGET, sha, require

def classify(a,b,manifest,added_files):
    old,new=a['names'],b['names']
    require(all(new.get(k)==v for k,v in old.items()),'original names/IDs changed')
    A={tuple(s.split('/',1)) for s in manifest['androidx_new_names']}
    C={tuple(s.split('/',1)) for s in manifest['captcha_new_names']}
    require(len(A)==32 and len(C)==24 and not A&C,'invalid dependency scope')
    actual={v:k for k,v in new.items() if k not in old}
    require(len(actual)==56 and set(actual)==A|C,'added resource identity mismatch')
    rmap=manifest['captcha_r_fields'];require(len(rmap)==27,'R field scope')
    require(set(rmap)=={'/'.join(x) for x in C}|{'id/progress_bar','id/webview','string/vk_retry'},'R field names')
    for s,v in rmap.items(): require(new.get(int(v,16))==tuple(s.split('/',1)),'R field ID mismatch')
    for s in ('id/progress_bar','id/webview','string/vk_retry'):require(old.get(int(rmap[s],16))==tuple(s.split('/',1)),'shared R ID mismatch')
    out={}
    for label,names in [('androidx',A),('captcha',C)]:
        ids={actual[n] for n in names};rows={k:v for k,v in b['entries'].items() if k[0] in ids};paths=set()
        for _,v in rows.values():
            if v[0]=='simple' and v[1][0]==3:
                s=v[1][1][0]
                if s.startswith('res/') and s in added_files:paths.add(s)
        out[label]={'ids':len(ids),'entries':len(rows),'files':sorted(paths),'named_ids':{'/'.join(n):f'0x{actual[n]:08x}' for n in sorted(names)}}
    p,q=set(out['androidx']['files']),set(out['captcha']['files'])
    require(not p&q and p|q==added_files,'added resource path mismatch')
    require(len(p)==45 and len(q)==10,'resource file counts')
    require(out['androidx']['entries']==663 and out['captcha']['entries']==24,'resource variant counts')
    return out

def read_r_fields(root):
    fields={}
    for typ in ('anim','color','drawable','id','layout','string','style'):
        s=(root/'com/vk/id/captcha'/f'R${typ}.smali').read_text()
        declared=set(re.findall(r'^\.field public static (\w+):I$',s,re.M))
        assignments=re.findall(r'^    const (v\d+), (0x[0-9a-f]+)\s+    sput \1, Lcom/vk/id/captcha/R\$'+typ+r';->(\w+):I$',s,re.M)
        require(len(assignments)==len(declared) and {a[2] for a in assignments}==declared,'R field assignment mismatch')
        for _,v,n in assignments:fields[typ+'/'+n]=v
    return fields

def audit(base,release,manifest,baksmali):
    require(sha(base.read_bytes())==BASE and sha(release.read_bytes())==TARGET,'APK hash mismatch')
    with zipfile.ZipFile(base) as za,zipfile.ZipFile(release) as zb:
        A,B=set(za.namelist()),set(zb.namelist());require(len(A)==len(za.namelist()) and len(B)==len(zb.namelist()),'duplicate ZIP names')
        a,b=[parse(z.read('resources.arsc')) for z in (za,zb)]
        paths={n for n in B-A if n.startswith('res/')};out=classify(a,b,manifest,paths)
        require('assets/index.html' in B-A,'SDK asset missing')
        out['asset']={'path':'assets/index.html','sha256':sha(zb.read('assets/index.html')),'bytes':len(zb.read('assets/index.html'))}
        with tempfile.TemporaryDirectory() as d:
            root=Path(d);dex=root/'classes9.dex';dex.write_bytes(zb.read('classes9.dex'))
            subprocess.run(['java','-jar',str(baksmali),'disassemble',str(dex),'--classes',','.join('Lcom/vk/id/captcha/R$'+t+';' for t in ('anim','color','drawable','id','layout','string','style')),'-o',str(root/'r')],check=True)
            require(read_r_fields(root/'r')==manifest['captcha_r_fields'],'release R mapping mismatch')
        out['r_fields_verified']=27;out['original_ids_preserved']=len(a['names']);out['added_files_verified']=len(paths);out['base_apk_sha256']=BASE;out['release_apk_sha256']=TARGET
        return out
if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__)
    for name in ('base','release','manifest','baksmali','output'):p.add_argument(name,type=Path)
    a=p.parse_args();r=audit(a.base,a.release,json.loads(a.manifest.read_text()),a.baksmali);a.output.write_text(json.dumps(r,indent=2)+'\n');print({k:{x:v for x,v in d.items() if x not in ('files','named_ids')} if isinstance(d,dict) else d for k,d in r.items()})
