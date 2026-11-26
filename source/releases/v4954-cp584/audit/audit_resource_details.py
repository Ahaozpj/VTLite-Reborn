#!/usr/bin/env python3
"""Local CP584 refinement of the resource inventory; does not export resource values.
Namespace-only is a structural classification, not proof of platform equivalence.
"""
import argparse, collections, hashlib, io, json, struct, zipfile
from pathlib import Path
from audit_resources import canonical, hdr, require, BASE, TARGET, sha
from PIL import Image

def namespace_only(a,b):
    # Retain all element and text events, including comments and typed attributes.
    if a==b:return False
    def strip(v):return [e for e in v if e[0] not in (256,257)]
    if strip(a)!=strip(b):return False
    # A deleted namespace event must carry no comment; preserve remaining order.
    j=0
    for e in a:
        if j<len(b) and e==b[j]:j+=1
        elif e[0] not in (256,257) or e[1] is not None:return False
    return j==len(b)

def png_summary(a,b):
    def decode(data):
        with Image.open(io.BytesIO(data)) as im:
            require(im.format=='PNG','not PNG');im.verify()
        with Image.open(io.BytesIO(data)) as im:
            require(not getattr(im,'is_animated',False),'animated PNG');im.load();return im.size,im.convert('RGBA').tobytes()
    x,y=decode(a),decode(b)
    return {'dimensions_equal':x[0]==y[0],'rgba_equal':x==y,'base_size':list(x[0]),'release_size':list(y[0])}

def table_layout(b):
    t,h,n=hdr(b,0);require((t,h,n)==(2,12,len(b)),'table header');p=h;chunks=[];packages=0
    while p<n:
        t,h,z=hdr(b,p);require(t in (1,0x200),'unknown table chunk');chunks.append({'type':t,'size':z});packages+=t==0x200;p+=z
    require(packages==struct.unpack_from('<I',b,8)[0],'package count');return {'bytes':len(b),'packages':packages,'chunks':chunks}

def audit(base,release):
    require(sha(base.read_bytes())==BASE and sha(release.read_bytes())==TARGET,'wrong APK hashes')
    rows=[];outside={}
    with zipfile.ZipFile(base) as a,zipfile.ZipFile(release) as b:
        A=set(a.namelist());B=set(b.namelist());require(len(A)==len(a.namelist()) and len(B)==len(b.namelist()),'duplicate ZIP names')
        for n in sorted((A|B)):
            if not n.startswith('res/'):continue
            x=a.read(n) if n in A else None;y=b.read(n) if n in B else None
            if x==y:continue
            row={'path':n,'base_sha256':sha(x) if x is not None else None,'release_sha256':sha(y) if y is not None else None}
            if x is None:
                row['category']='added_xml' if n.endswith('.xml') else 'added_png' if n.endswith('.png') else 'added_other'
                if row['category']=='added_xml':canonical(y)
                if row['category']=='added_png':png_summary(y,y)
            elif y is None:row['category']='removed'
            elif n.endswith('.xml'):
                v,w=canonical(x),canonical(y)
                row['category']='xml_equal' if v==w else 'namespace_deletion_only' if namespace_only(v,w) else 'xml_content_difference'
            elif n.endswith('.png'):
                row.update(png_summary(x,y));row['category']='png_rgba_equal' if row['rgba_equal'] else 'png_rgba_changed'
            else:row['category']='other_changed'
            rows.append(row)
        for n in ('AndroidManifest.xml','resources.arsc','assets/index.html'):
            x=a.read(n) if n in A else None;y=b.read(n) if n in B else None
            outside[n]={'base_sha256':sha(x) if x is not None else None,'release_sha256':sha(y) if y is not None else None}
            if n=='resources.arsc':outside[n].update(base_layout=table_layout(x),release_layout=table_layout(y))
            elif n=='AndroidManifest.xml':
                outside[n].update(base_events=len(canonical(x)),release_events=len(canonical(y)))
            else:outside[n].update(added=x is None,release_bytes=len(y))
    return {'schema':1,'base_apk_sha256':BASE,'release_apk_sha256':TARGET,'counts':dict(collections.Counter(r['category'] for r in rows)),'entries':rows,'outside_res':outside}

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('base',type=Path);p.add_argument('release',type=Path);p.add_argument('output',type=Path);a=p.parse_args();r=audit(a.base,a.release);a.output.write_text(json.dumps(r,indent=2)+'\n');print(r['counts']);print(r['outside_res'])
