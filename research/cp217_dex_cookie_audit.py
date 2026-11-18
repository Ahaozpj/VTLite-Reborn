#!/usr/bin/env python3
"""CP217 read-only DEX inventory; never reads or prints credentials or cookie values."""
import argparse, hashlib, re, struct, sys, zipfile
from pathlib import Path

def u4(b,o):
    return struct.unpack_from('<I',b,o)[0]

def parse(b):
    if b[:4] != b'dex\n' or len(b) < 112:
        raise ValueError("invalid DEX magic/header")
    sc,so=u4(b,0x38),u4(b,0x3c)
    tc,to=u4(b,0x40),u4(b,0x44)
    mc,mo=u4(b,0x58),u4(b,0x5c)
    cc,co=u4(b,0x60),u4(b,0x64)
    for count,off,width in [(sc,so,4),(tc,to,4),(mc,mo,8),(cc,co,32)]:
        if count > 3000000 or off + count*width > len(b):
            raise ValueError("invalid DEX table bounds")
    strings=[]
    for i in range(sc):
        pos=u4(b,so+4*i)
        for _ in range(5):
            v=b[pos]; pos+=1
            if v < 128: break
        else:
            raise ValueError("invalid ULEB128")
        end=b.index(0,pos)
        strings.append(b[pos:end].decode('utf-8','replace'))
    types=[strings[u4(b,to+4*i)] for i in range(tc)]
    targets={}
    for i in range(cc):
        name=types[u4(b,co+32*i)]
        if re.search(r'cookie|session|logout|authhelper|usersstore|userstore|webauth',name,re.I):
            targets[name]=set()
    platform={name:set() for name in [
        'Landroid/webkit/CookieManager;',
        'Landroid/webkit/WebStorage;',
        'Landroid/content/SharedPreferences$Editor;'
    ]}
    for i in range(mc):
        ci,_,ni=struct.unpack_from('<HHI',b,mo+8*i)
        cl=types[ci]; name=strings[ni]
        if cl in targets: targets[cl].add(name)
        if cl in platform: platform[cl].add(name)
    return cc,targets,platform

def main():
    p=argparse.ArgumentParser()
    p.add_argument('apk',type=Path)
    p.add_argument('--sha256',required=True)
    p.add_argument('--size',type=int,required=True)
    p.add_argument('--output',type=Path,default=Path('cp217_report.md'))
    a=p.parse_args()
    if a.apk.stat().st_size!=a.size: raise ValueError('APK size mismatch')
    h=hashlib.sha256()
    with a.apk.open('rb') as f:
        for part in iter(lambda:f.read(1024*1024),b''): h.update(part)
    sha=h.hexdigest()
    if sha != a.sha256: raise ValueError('APK SHA256 mismatch')
    lines=['# CP217 - static cookie/session method inventory', '',
           'Reference: CP205 v4850; APK remains unchanged.',
           f'APK integrity: PASS, SHA-256 {sha}.', '',
           'Limitation: method references in DEX do not prove invocation at logout. No fix is claimed.','']
    dex_count=class_count=0
    with zipfile.ZipFile(a.apk) as z:
        bad=z.testzip()
        if bad: raise ValueError('APK ZIP CRC error')
        for name in sorted(z.namelist()):
            if not re.fullmatch(r'classes\d*\.dex',name): continue
            dex_count+=1
            classes,targets,platform=parse(z.read(name))
            class_count+=classes
            lines += [f'## {name}',f'Defined classes: {classes}; relevant named classes: {len(targets)}.','']
            for cl,methods in sorted(targets.items()):
                selected=[m for m in sorted(methods) if re.search('cookie|session|logout|signout|clear|remove|save|restore|flush|delete|invalidate',m,re.I)]
                lines.append(f'- {cl}: '+(', '.join(selected[:25]) if selected else 'no matching method names'))
            lines += ['', 'Platform API references (not proof of execution):']
            for cl,methods in platform.items():
                selected=[m for m in sorted(methods) if re.search('cookie|clear|remove|flush|delete|getinstance',m,re.I)]
                lines.append(f'- {cl}: '+(', '.join(selected) if selected else 'no relevant references'))
            lines.append('')
    if not dex_count: raise ValueError('No classes*.dex')
    lines.insert(5,f'DEX: {dex_count}; total defined classes: {class_count}.')
    a.output.write_text('\n'.join(lines)+'\n',encoding='utf-8')
    print(f'PASS: verified reference APK, {dex_count} DEX files; report at {a.output}')

if __name__=='__main__':
    try: main()
    except Exception as exc:
        print(f'FAIL: {exc}',file=sys.stderr)
        sys.exit(1)
