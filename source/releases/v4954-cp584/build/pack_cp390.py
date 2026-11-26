#!/usr/bin/env python3
"""CP390: create UNSIGNED settings-only v4930 QA and v4931 CP366 rollback.

Source signed APK is exact v4929 (CP389 safe return to CP366). Actual signer
is handled separately with private signing material; never commit credentials.
"""
import argparse, hashlib, json, re, struct, copy, zipfile
from pathlib import Path

BASE_SHA='c9c9e2cd4c949f3e760e40e9ff6877047e93741dc4790441e3a317412e468639'
NEW_DEX_SHA='67ee56f70bb64ae59f0eb53364f5f4cd7a88e51679173ea8cc106016068c0b91'
SIGN=re.compile(r'META-INF/[^/]+\.(?:SF|RSA|DSA|EC)|META-INF/MANIFEST\.MF',re.I)

def sha(b):return hashlib.sha256(b).hexdigest()
def need(x,msg):
 if not x:raise ValueError(msg)
def patch_version(data,version):
 b=bytearray(data);pos=8;refs=[];found=[]
 while pos<len(b):
  typ,hdr,size=struct.unpack_from('<HHI',b,pos)
  need(size>=hdr>=8 and pos+size<=len(b),'Invalid AXML')
  if typ==0x180:refs=list(struct.unpack_from('<'+'I'*((size-hdr)//4),b,pos+hdr))
  if typ==0x102:
   first,stride,n=struct.unpack_from('<HHH',b,pos+24)
   for i in range(n):
    off=pos+16+first+i*stride
    name=struct.unpack_from('<I',b,off+4)[0]
    if name<len(refs) and refs[name]==0x0101021b:
     need(struct.unpack_from('<HBBI',b,off+12)==(8,0,0x10,4929),'Unexpected base version')
     found.append(off+16)
  pos+=size
 need(len(found)==1,'versionCode not unique')
 struct.pack_into('<I',b,found[0],version)
 return bytes(b)
def nonsig(z):
 names=z.namelist();need(len(names)==len(set(names)),'duplicate entries')
 return {x for x in names if not SIGN.fullmatch(x)}
def pack(base,out,repl):
 need(not out.exists(),'output exists')
 with zipfile.ZipFile(base) as src,zipfile.ZipFile(out,'x',allowZip64=False) as dst:
  names=nonsig(src)
  for info in src.infolist():
   if info.filename not in names:continue
   e=copy.copy(info)
   if e.compress_type==zipfile.ZIP_STORED and not e.is_dir():
    align=16384 if e.filename.endswith('.so') else 4
    off=dst.fp.tell()+30+len(e.filename.encode())+len(e.extra)
    if off%align:
     gap=(-(off+4))%align
     e.extra+=struct.pack('<HH',0xd935,gap)+bytes(gap)
   dst.writestr(e,repl.get(e.filename,src.read(e)))
def verify(base,out,repl,version):
 with zipfile.ZipFile(base) as src,zipfile.ZipFile(out) as dst,out.open('rb') as raw:
  names=nonsig(src);need(names==nonsig(dst),'entry set changed');need(dst.testzip() is None,'ZIP CRC');diff=[];aligned=0
  for n in names:
   a,b=src.read(n),dst.read(n)
   need(b==repl.get(n,a),'Unexpected payload '+n)
   need(src.getinfo(n).compress_type==dst.getinfo(n).compress_type,'compression change')
   if a!=b:diff.append(n)
   info=dst.getinfo(n)
   if info.compress_type==zipfile.ZIP_STORED and not info.is_dir():
    raw.seek(info.header_offset+26);length,extra=struct.unpack('<HH',raw.read(4))
    off=info.header_offset+30+length+extra
    need(off%(16384 if n.endswith('.so') else 4)==0,'alignment '+n)
    aligned+=1
  need(set(diff)==set(repl),'changes not isolated')
  return {'versionCode':version,'unsigned_sha256':sha(out.read_bytes()),'bytes':out.stat().st_size,'changed_payloads':sorted(diff),'unchanged_payloads':len(names)-len(diff),'all_non_signature_payloads':len(names),'aligned_stored_entries':aligned,'baseline_sha256':BASE_SHA}
def main():
 p=argparse.ArgumentParser();p.add_argument('--base',required=True,type=Path);p.add_argument('--version',required=True,type=int,choices=[4930,4931]);p.add_argument('--dex',type=Path);p.add_argument('--output',required=True,type=Path);p.add_argument('--gate',required=True,type=Path);a=p.parse_args()
 need(sha(a.base.read_bytes())==BASE_SHA,'Not exact rollback CP389 v4929')
 with zipfile.ZipFile(a.base) as src:
  replacement={'AndroidManifest.xml':patch_version(src.read('AndroidManifest.xml'),a.version)}
  if a.version==4930:
   need(a.dex is not None,'Dex needed')
   dex=a.dex.read_bytes();need(sha(dex)==NEW_DEX_SHA,'Unexpected classes6.dex')
   replacement['classes6.dex']=dex
  else:need(a.dex is None,'Rollback must not include changed dex')
 pack(a.base,a.output,replacement)
 gate=verify(a.base,a.output,replacement,a.version)
 a.gate.write_text(json.dumps(gate,indent=2)+'\n')
 print('CP390_UNSIGNED_PACK_PASS',a.version,gate['changed_payloads'],gate['unchanged_payloads'])
if __name__=='__main__':main()
