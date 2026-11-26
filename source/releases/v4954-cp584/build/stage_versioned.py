#!/usr/bin/env python3
"""Offline candidate for settings-only QA; never signs or installs an APK."""
import argparse, hashlib, importlib.util, json, struct, tempfile, zipfile, zlib
from pathlib import Path
H441='05c1854b24b39a74b14e915df43fb67909b3253cfbfa320f967096067ca313d0'
H390='ca70ff52f3b3f3176a4b0300a8deb0abb672b57ee667b683ec493d4646ede03a'
D6='67ee56f70bb64ae59f0eb53364f5f4cd7a88e51679173ea8cc106016068c0b91'
def need(x,msg):
    if not x: raise ValueError(msg)
def sha(x): return hashlib.sha256(x).hexdigest()
def field(m):
    need(len(m)>=8 and struct.unpack_from('<HHI',m)==(3,8,len(m)), 'invalid XML root')
    pos=8; refs=[]; offsets=[]
    while pos<len(m):
        need(pos+8<=len(m),'short chunk')
        typ,hdr,size=struct.unpack_from('<HHI',m,pos)
        need(size>=hdr>=8 and pos+size<=len(m),'invalid chunk')
        if typ==0x180:
            need((size-hdr)%4==0,'bad map')
            refs=list(struct.unpack_from('<'+'I'*((size-hdr)//4),m,pos+hdr))
        if typ==0x102:
            need(size>=36 and hdr==16,'bad element')
            first,stride,count=struct.unpack_from('<HHH',m,pos+24)
            need(stride>=20 and first>=20 and 16+first+stride*count<=size,'bad attributes')
            for i in range(count):
                off=pos+16+first+i*stride
                name=struct.unpack_from('<I',m,off+4)[0]
                if name<len(refs) and refs[name]==0x0101021b:
                    need(struct.unpack_from('<HBB',m,off+12)==(8,0,0x10),'bad version type')
                    offsets.append(off+16)
        pos+=size
    need(len(offsets)==1,'version not unique')
    return offsets[0],struct.unpack_from('<I',m,offsets[0])[0]
def patch(m,old,new):
    off,v=field(m);need(v==old and new>old and new<2**31,'bad version transition')
    out=bytearray(m);struct.pack_into('<I',out,off,new)
    need(field(out)==(off,new),'version readback')
    need(out[:off]==m[:off] and out[off+4:]==m[off+4:],'manifest scope')
    return bytes(out)
def dex_header(d):
    return len(d)>=112 and d[:4]==b'dex\n' and d[7]==0 and struct.unpack_from('<I',d,32)[0]==len(d) and hashlib.sha1(d[32:]).digest()==d[12:32] and zlib.adler32(d[12:])&0xffffffff==struct.unpack_from('<I',d,8)[0]
def load(p):
    s=importlib.util.spec_from_file_location('packer',p);m=importlib.util.module_from_spec(s);s.loader.exec_module(m);return m
def run(base,ref,helper,report):
    need(sha(base.read_bytes())==H441,'wrong CP441');need(sha(ref.read_bytes())==H390,'wrong CP390')
    packer=load(helper)
    with zipfile.ZipFile(base) as a,zipfile.ZipFile(ref) as b:
        m=a.read('AndroidManifest.xml');d=b.read('classes6.dex');need(sha(d)==D6,'wrong DEX')
        new=patch(m,4941,4942); off,_=field(m)
        negatives=[(m,4940,4942),(m,4941,4941),(m,4941,4940),(m[:20],4941,4942),(m,4941,2**31)]
        rejected=0
        for x,y,z in negatives:
            try:patch(x,y,z)
            except ValueError:rejected+=1
        need(rejected==len(negatives),'negative control accepted')
        repl={'AndroidManifest.xml':new,'classes6.dex':d}
        with tempfile.TemporaryDirectory(prefix='cp491_private_') as tmp:
            out=Path(tmp)/'UNSIGNED_DO_NOT_INSTALL.apk';packer.pack(base,out,repl)
            result=packer.verify(base,out,repl,4942)
            with zipfile.ZipFile(out) as q:
                need(field(q.read('AndroidManifest.xml'))[1]==4942,'version wrong')
                names=[n for n in q.namelist() if n.startswith('classes') and n.endswith('.dex')]
                need(len(names)==10 and all(dex_header(q.read(n)) for n in names),'DEX header failure')
                need(all(q.read(n)==a.read(n) for n in names if n!='classes6.dex'),'other DEX changed')
                need(not any(packer.SIGN.fullmatch(n) for n in q.namelist()),'signature entries retained')
            result.update(baseline_sha256=H441,reference_sha256=H390,corrected_dex_sha256=D6,manifest_version_offset=off,manifest_changed_byte_count=sum(x!=y for x,y in zip(m,new)),all_10_dex_headers_verified=True,other_9_dex_unchanged=True,negative_controls_rejected=rejected,negative_controls_total=len(negatives),signed=False,installable=False,device_tested=False,release_approved=False)
    report.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('base',type=Path);p.add_argument('reference',type=Path);p.add_argument('packer',type=Path);p.add_argument('report',type=Path);a=p.parse_args();run(a.base,a.reference,a.packer,a.report)
