#!/usr/bin/env python3
"""Reproduce narrowly scoped Reborn branding/network changes on authorized original APK.
Outputs local resources, not a complete APK or a release resource table.
"""
import argparse, struct, zipfile, hashlib
from pathlib import Path
from audit_resource_table import parse, strings, chunks, compare
from audit_resources import BASE, TARGET, sha, require, canonical, u32

NAME=0x7f1200e0
COLOR=0x7f060325
NEW_COLOR=0xff0b0c1a
OLD_COLOR=0xfffcfcfc

def replace_pool_string(pool,old,new):
    count,styles,flags,start,sty=struct.unpack_from('<5I',pool,8)
    require(flags==256,'expected unsorted UTF8 pool')
    decoded=strings(pool); matches=[i for i,v in enumerate(decoded) if v==(old,())]
    require(len(matches)==1,'unique unstyled string required')
    require(not any(old==name for _,spans in decoded for name,_,_ in spans),'style references old string')
    i=matches[0]; boundary=sty or len(pool)
    raw=new.encode('utf8'); units=len(new.encode('utf-16le'))//2
    require(len(raw)<128 and units<128,'short UTF8 required')
    ext=bytes([units,len(raw)])+raw+b'\0';ext+=b'\0'*(-len(ext)%4)
    result=bytearray(pool[:boundary]+ext+pool[boundary:]);struct.pack_into('<I',result,4,len(result));struct.pack_into('<I',result,28+4*i,boundary-start)
    if sty:struct.pack_into('<I',result,24,sty+len(ext))
    expected=list(decoded);expected[i]=(new,());require(strings(result)==expected,'pool change mismatch');return bytes(result)

def branding(table):
    before=parse(table); top=list(chunks(table,12)); gp=replace_pool_string(top[0][3],'VTLite','VTLite Reborn');pkg=bytearray(top[1][3]); count=0
    for pos,t,h,c in chunks(pkg,288):
        if t!=0x201 or c[8]!=(COLOR>>16)&255:continue
        idx=COLOR&65535
        if idx>=u32(c,12):continue
        off=u32(c,h+4*idx)
        if off==0xffffffff:continue
        q=u32(c,16)+off;require(struct.unpack_from('<HBBI',c,q+8)==(8,0,28,OLD_COLOR),'unexpected launcher color');struct.pack_into('<I',pkg,pos+q+12,NEW_COLOR);count+=1
    require(count==1,'expected one color entry')
    out=bytearray(table[:12]+gp+pkg);struct.pack_into('<I',out,4,len(out));after=parse(out);diff=compare(before,after)
    require(diff['changed_entries']==8 and diff['entry_payload_changed']==8 and not diff['added_entries'] and not diff['removed_entries'],'unexpected table changes')
    require({int(r['id'],16) for r in diff['differences']}=={NAME,COLOR},'unexpected resource IDs')
    require(before['specs']==after['specs'] and before['names']==after['names'] and before['package_name']==after['package_name'],'unexpected metadata')
    return bytes(out)

def network(data):
    before=canonical(data);out=bytearray(data);p=8;pool=None;changes=0
    for pos,t,h,c in chunks(data,8):
        if t==1:
            from audit_resources import pool as read_pool
            pool=read_pool(c,h)
        elif t==0x102:
            for j in range(struct.unpack_from('<H',c,28)[0]):
                q=36+j*20;_,key,raw,sz,res,typ,v=struct.unpack_from('<IIIHBBI',c,q)
                if pool[key]=='src' and typ==3 and pool[v]=='user':
                    require(pool[raw]=='user','unexpected raw trust anchor');i=pool.index('system');struct.pack_into('<I',out,pos+q+8,i);struct.pack_into('<I',out,pos+q+16,i);changes+=1
                elif pool[key]=='cleartextTrafficPermitted':
                    require(typ==18 and v==0xffffffff,'unexpected cleartext setting');struct.pack_into('<I',out,pos+q+16,0);changes+=1
    require(changes==3,'expected three network edits');canonical(out);return bytes(out)

def main(base,target,out):
    require(sha(base.read_bytes())==BASE and sha(target.read_bytes())==TARGET,'wrong APK hashes');require(not out.exists(),'output exists')
    with zipfile.ZipFile(base) as a,zipfile.ZipFile(target) as b:
        orig=a.read('resources.arsc'); release=parse(b.read('resources.arsc')); patched=branding(orig); p=parse(patched)
        for k in p['entries']:
            if k[0] in (NAME,COLOR):require(p['entries'][k]==release['entries'][k],'branding mismatch')
        x=network(a.read('res/xml/network_security_config.xml'));y=b.read('res/xml/network_security_config.xml');require(canonical(x)==canonical(y),'network structure mismatch')
    out.mkdir();(out/'resources.arsc').write_bytes(patched);(out/'network_security_config.xml').write_bytes(x);print('PASS 8 branding entries; 3 network edits; XML canonical match; exact XML bytes:',x==y)
if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('base',type=Path);p.add_argument('release',type=Path);p.add_argument('output',type=Path);a=p.parse_args();main(a.base,a.release,a.output)
