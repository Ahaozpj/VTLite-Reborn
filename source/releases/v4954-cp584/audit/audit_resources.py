#!/usr/bin/env python3
"""Conservative local binary XML inventory; never emits resource content.
Equality is structural within this parser, not Android runtime equivalence.
Unknown chunks, styled pools and nonstandard records remain unresolved.
"""
import argparse, collections, hashlib, json, struct, zipfile, re
from pathlib import Path
BASE='2c312fecefce700bae0a956227f79474a6e17da64e93f22f0cb98d4e0436bb30'
TARGET='5f6f67d33141e398e97f951f68a83fa35d1c02bedf99a2e31f2bb714b521a3a8'
NONE=0xffffffff

def sha(b):return hashlib.sha256(b).hexdigest()
def require(ok,msg):
    if not ok:raise ValueError(msg)
def u16(b,p):return struct.unpack_from('<H',b,p)[0]
def u32(b,p):return struct.unpack_from('<I',b,p)[0]
def hdr(b,p):
    t,h,n=struct.unpack_from('<HHI',b,p);require(8<=h<=n<=len(b)-p and n%4==0,'chunk bounds');return t,h,n

def pool(b,h):
    require(h==28,'pool header'); count,styles,flags,start,sty=struct.unpack_from('<5I',b,8)
    require(styles==0 and sty==0 and flags&~0x101==0,'unsupported styled/flagged pool')
    require(28+4*count<=start<=len(b),'pool offsets')
    def length(p,utf8):
        if utf8:
            n=b[p];return (((n&127)<<8)|b[p+1],p+2) if n&128 else (n,p+1)
        n=u16(b,p);return (((n&32767)<<16)|u16(b,p+2),p+4) if n&32768 else (n,p+2)
    out=[]
    for i in range(count):
        p=start+u32(b,28+4*i);require(start<=p<len(b),'string offset')
        n,p=length(p,bool(flags&256))
        if flags&256:
            m,p=length(p,True);require(p+m<len(b) and b[p+m]==0,'UTF8 bounds');s=b[p:p+m].decode('utf-8',errors='surrogatepass');s=s.encode('utf-16le',errors='surrogatepass').decode('utf-16le');require(len(s.encode('utf-16le'))//2==n,'UTF8 length')
        else:
            require(p+2*n+2<=len(b) and b[p+2*n:p+2*n+2]==b'\0\0','UTF16 bounds');s=b[p:p+2*n].decode('utf-16le')
        out.append(s)
    return out

def canonical(b):
    t,h,n=hdr(b,0);require((t,h,n)==(3,8,len(b)),'XML header');p=8;strings=None;ids=[];events=[];stack=[];ns=[];roots=0;map_seen=False
    def s(i):
        if i==NONE:return None
        require(strings is not None and i<len(strings),'string index');return strings[i]
    def val(c,o):
        size,zero,typ,data=struct.unpack_from('<HBBI',c,o);require(size==8 and zero==0,'typed value');return (typ,s(data) if typ==3 else data)
    while p<n:
        t,h,z=hdr(b,p);c=b[p:p+z];p+=z
        if t==1:
            require(strings is None and not events,'pool position');strings=pool(c,h);continue
        require(strings is not None,'missing pool')
        if t==0x180:
            require(h==8 and not map_seen and not events,'map position');ids=list(struct.unpack_from('<'+'I'*((z-8)//4),c,8));require(len(ids)<=len(strings),'resource map bounds');map_seen=True;continue
        require(h==16 and t in range(0x100,0x105),'unsupported node');comment=s(u32(c,12))
        if t in (0x100,0x101,0x103):
            require(z==24,'node size');pair=(s(u32(c,16)),s(u32(c,20)));require(pair[1] is not None,'node name')
            if t==0x100:ns.append(pair)
            elif t==0x101:require(bool(ns) and ns.pop()==pair,'namespace order')
            else:require(bool(stack) and stack.pop()==pair,'element order')
            events.append((t,comment,pair))
        elif t==0x102:
            require(z>=36,'element header');a,k=struct.unpack_from('<II',c,16); pair=(s(a),s(k));require(pair[1] is not None,'element name');start,size,count,ididx,clidx,stidx=struct.unpack_from('<6H',c,24);require(start==20 and size==20 and z==36+20*count and max(ididx,clidx,stidx)<=count,'attribute layout');attrs=[]
            if not stack:roots+=1
            stack.append(pair)
            for j in range(count):
                o=36+20*j; a,k,r=struct.unpack_from('<III',c,o);require(k!=NONE,'attribute name');attrs.append((s(a),s(k),ids[k] if k<len(ids) else 0,s(r),val(c,o+12)))
            events.append((t,comment,pair,(ididx,clidx,stidx),attrs))
        else:
            require(z==28 and stack,'text node');events.append((t,comment,s(u32(c,16)),val(c,20)))
    require(not stack and not ns and roots==1,'unbalanced XML');return events

def audit(a,b):
    require(sha(a.read_bytes())==BASE and sha(b.read_bytes())==TARGET,'wrong APK hashes')
    rows=[]
    with zipfile.ZipFile(a) as x,zipfile.ZipFile(b) as y:
        A=set(x.namelist());B=set(y.namelist());require(len(A)==len(x.namelist()) and len(B)==len(y.namelist()),'duplicate ZIP name')
        for n in sorted(A|B):
            old=x.read(n) if n in A else None;new=y.read(n) if n in B else None
            if old==new:continue
            kind='added' if old is None else 'removed' if new is None else 'changed'
            if n.startswith('META-INF/') or re.fullmatch(r'classes\d*\.dex',n):category='dex_or_signature'
            elif n=='resources.arsc':category='resource_table_pending'
            elif n.endswith('.xml') and old is not None and new is not None:
                try:category='xml_structure_equal' if canonical(old)==canonical(new) else 'xml_structure_changed'
                except (ValueError,IndexError,struct.error,UnicodeError) as e:category='xml_unresolved'
            elif n.endswith('.xml'):category='xml_'+kind
            else:category='other_'+kind
            rows.append({'path':n,'kind':kind,'category':category,'base_sha256':sha(old) if old is not None else None,'release_sha256':sha(new) if new is not None else None})
    return {'schema':1,'base_apk_sha256':BASE,'release_apk_sha256':TARGET,'counts':dict(collections.Counter(r['category'] for r in rows)),'entries':rows}
if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('base',type=Path);p.add_argument('release',type=Path);p.add_argument('output',type=Path);a=p.parse_args();r=audit(a.base,a.release);a.output.write_text(json.dumps(r,indent=2)+'\n');print(r['counts'])
