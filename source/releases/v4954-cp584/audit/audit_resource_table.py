#!/usr/bin/env python3
"""Compare pinned APK resource tables locally, emitting counts and hashes only.
Supports the observed dense, non-compact ResTable format; unknown layouts fail closed.
Not an Android resource resolver or a build tool.
"""
import argparse, collections, json, struct, zipfile
from pathlib import Path
from audit_resources import BASE, TARGET, sha, hdr, require, u16, u32, NONE

def chunks(b,start):
    p=start
    while p<len(b):
        t,h,n=hdr(b,p);yield p,t,h,b[p:p+n];p+=n
    require(p==len(b),'chunk coverage')

def strings(b):
    t,h,n=hdr(b,0);require((t,h,n)==(1,28,len(b)),'string pool header')
    count,styles,flags,start,sty=struct.unpack_from('<5I',b,8)
    require(flags&~0x101==0 and styles<=count and 28+4*(count+styles)<=start<=len(b),'pool bounds')
    require((styles==0 and sty==0) or (styles>0 and start<=sty<len(b)),'style offset')
    end=sty or len(b);utf8=bool(flags&256)
    def length(p,wide):
        require(p+(2 if wide else 1)<=end,'length bounds');v=u16(b,p) if wide else b[p];size=2 if wide else 1;mask=0x8000 if wide else 0x80
        if v&mask:
            require(p+2*size<=end,'long length bounds');return ((v&(mask-1))<<(16 if wide else 8))|(u16(b,p+size) if wide else b[p+size]),p+2*size
        return v,p+size
    out=[]
    for i in range(count):
        p=start+u32(b,28+4*i);require(start<=p<end,'string offset');n,p=length(p,not utf8)
        if utf8:
            m,p=length(p,False);require(p+m<end and b[p+m]==0,'UTF8 bounds');s=b[p:p+m].decode('utf-8','surrogatepass').encode('utf-16le','surrogatepass').decode('utf-16le');require(len(s.encode('utf-16le'))//2==n,'UTF8 length')
        else:
            require(p+2*n+2<=end and b[p+2*n:p+2*n+2]==b'\0\0','UTF16 bounds');s=b[p:p+2*n].decode('utf-16le')
        out.append(s)
    spans={}
    for i in range(styles):
        off=u32(b,28+4*(count+i))
        if off==NONE:continue
        p=sty+off;ss=[];lim=len(out[i].encode('utf-16le'))//2
        require(p>=sty and p%4==0,'span offset')
        while True:
            require(p+4<=len(b),'span terminator');name=u32(b,p)
            if name==NONE:break
            require(p+12<=len(b) and name<len(out),'span record');first,last=struct.unpack_from('<II',b,p+4);require(first<=last<lim,'span bounds');ss.append((out[name],first,last));p+=12
        spans[i]=tuple(ss)
    return [(s,spans.get(i,())) for i,s in enumerate(out)]

def parse(b):
    t,h,n=hdr(b,0);require((t,h,n)==(2,12,len(b)),'table header')
    top=list(chunks(b,h));require(len(top)==2 and top[0][1]==1 and top[1][1]==0x200 and u32(b,8)==1,'single package layout')
    global_pool=strings(top[0][3]);_,_,ph,p=top[1];require(ph==288,'package header');pid=u32(p,8);require(0<pid<=255,'package id');name=p[12:268].decode('utf-16le').rstrip('\0');to,lt,ko,lk,offset=struct.unpack_from('<5I',p,268);require(offset==0,'type offset')
    children=list(chunks(p,ph));pools={q:strings(c) for q,t,h,c in children if t==1};require(set(pools)=={to,ko} and to!=ko,'package pools')
    types,keys=pools[to],pools[ko];require(not any(v[1] for v in types+keys),'styled names')
    specs={};entries={};names={};configs=set()
    def value(c,o):
        require(o+8<=len(c),'value bounds');size,res,typ,data=struct.unpack_from('<HBBI',c,o);require(size==8 and res==0,'value layout');require(typ in (0,1,2,3,4,5,6,7,8,16,17,18,28,29,30,31),'value type')
        if typ==3:require(data<len(global_pool),'value string index');data=global_pool[data]
        return typ,data
    for _,t,h,c in children:
        if t==1:continue
        require(t in (0x201,0x202),'unknown package chunk');tid,flags,res,count=struct.unpack_from('<BBHI',c,8);require(0<tid<=len(types) and count<=65536,'type id/count')
        if t==0x202:
            require(h==16 and len(c)==16+4*count and tid not in specs,'spec layout');specs[tid]=(flags,res,tuple(u32(c,16+4*i) for i in range(count)));continue
        require(h==84 and flags==0 and res==0 and u32(c,20)==64,'unsupported type layout');start=u32(c,16);require(h+4*count<=start<=len(c) and start%4==0,'entry offsets');config=c[20:h].hex();require((tid,config) not in configs,'duplicate config');configs.add((tid,config))
        occupied=[]
        for i in range(count):
            off=u32(c,h+4*i)
            if off==NONE:continue
            q=start+off;require(q%4==0 and q+8<=len(c),'entry bounds');size,ef,k=struct.unpack_from('<HHI',c,q);require(k<len(keys) and ef&~7==0,'entry key/flags');rid=(pid<<24)|(tid<<16)|i;nm=(types[tid-1][0],keys[k][0]);require(rid not in names or names[rid]==nm,'inconsistent resource name');names[rid]=nm
            if ef&1:
                require(size==16 and q+16<=len(c),'map entry header');parent,num=struct.unpack_from('<II',c,q+8);end=q+16+12*num;require(end<=len(c),'map bounds');items=tuple((u32(c,q+16+12*j),value(c,q+20+12*j)) for j in range(num));require(len({k for k,v in items})==num,'duplicate map key');v=('bag',parent,items)
            else:
                require(size==8,'unsupported simple entry');end=q+16;v=('simple',value(c,q+8))
            occupied.append((q,end));entries[rid,config]=(ef,v)
        ordered=sorted(occupied);require(all(a[1]<=d[0] for a,d in zip(ordered,ordered[1:])),'overlapping entries')
        require(tid in specs and count==len(specs[tid][2]),'type/spec count')
    return {'package_id':pid,'package_name':name,'package_metadata':(lt,lk,offset),'specs':specs,'names':names,'entries':entries,'configs':configs,'global_strings':len(global_pool)}

def digest(v):return sha(json.dumps(v,ensure_ascii=True,separators=(',',':')).encode())
def compare(a,b):
    A,B=a['entries'],b['entries'];common=A.keys()&B.keys();changed={k for k in common if A[k]!=B[k]};old=set(A)-set(B);new=set(B)-set(A);na,nb=a['names'],b['names'];renamed={k for k in na.keys()&nb.keys() if na[k]!=nb[k]}
    sa={(i,j):x for i,(f,r,vs) in a['specs'].items() for j,x in enumerate(vs)};sb={(i,j):x for i,(f,r,vs) in b['specs'].items() for j,x in enumerate(vs)}
    rows=[]
    for k in sorted(changed|old|new):
        rid,c=k;rows.append({'id':f'{rid:08x}','config':c,'kind':'changed' if k in changed else 'added' if k in new else 'removed','base_sha256':digest(A[k]) if k in A else None,'release_sha256':digest(B[k]) if k in B else None})
    return {'base_entries':len(A),'release_entries':len(B),'equal_entries':len(common)-len(changed),'changed_entries':len(changed),'entry_flags_only':sum(A[k][1]==B[k][1] for k in changed),'entry_payload_changed':sum(A[k][1]!=B[k][1] for k in changed),'changed_ids':len({k[0] for k in changed}),'added_configs_existing_id':sum(k[0] in na for k in new), 'changed_type_spec_headers':sum(a['specs'][i][:2]!=b['specs'][i][:2] for i in a['specs'].keys()&b['specs'].keys()), 'changed_by_type':dict(collections.Counter(na[k[0]][0] for k in changed)), 'added_by_type':dict(collections.Counter(nb[k[0]][0] for k in new)),'added_entries':len(new),'removed_entries':len(old),'base_named_ids':len(na),'release_named_ids':len(nb),'renamed_ids':len(renamed),'added_ids':len(nb.keys()-na.keys()),'removed_ids':len(na.keys()-nb.keys()),'base_type_configs':len(a['configs']),'release_type_configs':len(b['configs']),'equal_type_configs':len(a['configs']&b['configs']),'changed_spec_slots':sum(sa[k]!=sb[k] for k in sa.keys()&sb.keys()),'added_spec_slots':len(sb.keys()-sa.keys()),'removed_spec_slots':len(sa.keys()-sb.keys()),'package_name_changed':a['package_name']!=b['package_name'],'package_id_equal':a['package_id']==b['package_id'],'package_metadata_equal':a['package_metadata']==b['package_metadata'],'differences':rows}

def audit(base,release):
    require(sha(base.read_bytes())==BASE and sha(release.read_bytes())==TARGET,'wrong APK hashes')
    with zipfile.ZipFile(base) as a,zipfile.ZipFile(release) as b:
        require(a.namelist().count('resources.arsc')==b.namelist().count('resources.arsc')==1,'duplicate or missing resource table');return compare(parse(a.read('resources.arsc')),parse(b.read('resources.arsc')))
if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('base',type=Path);p.add_argument('release',type=Path);p.add_argument('output',type=Path);a=p.parse_args();r=audit(a.base,a.release);a.output.write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k!='differences'})
