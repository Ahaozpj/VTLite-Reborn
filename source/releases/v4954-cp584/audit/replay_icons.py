#!/usr/bin/env python3
"""Recreate seven Reborn Phoenix launcher icons from the original artwork.
No APK or signing material needed to generate; optional pinned APK comparison.
"""
import argparse, hashlib, io, json, zipfile
from pathlib import Path
from PIL import Image, ImageDraw

SOURCE = 'a6ed9d91ab71dfbc60ce8df2514de6c67cba4dd0ee6126b3c50e2847eefb6842'
TARGET = '5f6f67d33141e398e97f951f68a83fa35d1c02bedf99a2e31f2bb714b521a3a8'
PATHS = {f'res/mipmap-{d}/vt_launcher.png': (s,s,'normal') for d,s in [('mdpi',48),('hdpi',72),('xhdpi',96),('xxhdpi',144),('xxxhdpi',192)]}
PATHS.update({'res/mipmap-hdpi/vt_launcher_round.png':(192,192,'round'),'res/mipmap-hdpi/vt_adaptive_launcher_foreground.png':(200,200,'adaptive')})

def sha(b): return hashlib.sha256(b).hexdigest()

def require(ok, message):
    if not ok: raise ValueError(message)

def artwork(p):
    b=p.read_bytes();require(sha(b)==SOURCE,'Wrong Phoenix artwork')
    with Image.open(io.BytesIO(b)) as im:
        require(im.format=='PNG' and im.size==(1254,1254) and not getattr(im,'is_animated',False),'Unexpected artwork format')
        return im.convert('RGBA')

def render(im,w,h,kind):
    if kind=='normal':
        r=im.resize((w,h),Image.Resampling.LANCZOS)
        require(r.getchannel('A').getextrema()==(255,255),'Expected opaque launcher')
        return r.convert('RGB')
    r=Image.new('RGBA',(w,h),(0,0,0,0))
    if kind=='round':
        q=im.resize((w,h),Image.Resampling.LANCZOS);m=Image.new('L',(w,h),0)
        ImageDraw.Draw(m).ellipse((0,0,w-1,h-1),fill=255);q.putalpha(m);r.alpha_composite(q)
    elif kind=='adaptive':
        s=round(min(w,h)*.72);q=im.resize((s,s),Image.Resampling.LANCZOS);m=Image.new('L',(s,s),0)
        ImageDraw.Draw(m).rounded_rectangle((0,0,s-1,s-1),radius=round(s*.2),fill=255);q.putalpha(m);r.alpha_composite(q,((w-s)//2,(h-s)//2))
    else: raise ValueError('Unknown icon kind')
    return r

def png(im):
    b=io.BytesIO();im.save(b,'PNG',optimize=True);return b.getvalue()

def generate(source,output,target=None):
    require(not output.exists(),'Output already exists');im=artwork(source)
    rendered={n:png(render(im,*dims)) for n,dims in PATHS.items()};rows=[]
    if target is not None:
        require(sha(target.read_bytes())==TARGET,'Wrong release APK')
        with zipfile.ZipFile(target) as z:
            for n,b in rendered.items():
                require(z.namelist().count(n)==1,'Missing or duplicate icon')
                ref=z.read(n)
                with Image.open(io.BytesIO(b)) as a,Image.open(io.BytesIO(ref)) as c:
                    require(a.size==c.size and a.convert('RGBA').tobytes()==c.convert('RGBA').tobytes(),'RGBA mismatch: '+n)
                rows.append({'path':n,'rgba_equal':True,'bytes_equal':b==ref,'generated_sha256':sha(b),'release_sha256':sha(ref)})
    output.mkdir(parents=True)
    for n,b in rendered.items():
        dest=output/n;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(b)
    return rows

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('artwork',type=Path);p.add_argument('output',type=Path);p.add_argument('--release',type=Path);a=p.parse_args();print(json.dumps(generate(a.artwork,a.output,a.release),indent=2))
