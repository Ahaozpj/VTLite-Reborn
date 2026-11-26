#!/usr/bin/env python3
"""Local reconstruction of CP584 manifest changes, not an APK builder.
Requires the pinned original APK; optional release comparison. No original manifest distributed.
"""
import argparse, struct, zipfile
from pathlib import Path
from audit_resources import canonical, sha, require, BASE, TARGET, NONE
ANDROID='http://schemas.android.com/apk/res/android'
OLD='com.vtosters.lite'; NEW='com.vtosters.reborn'
AUDIO_OLD='com.audioipc.player.libaudioipc_sensitive_data_provider_fix.AUDIO_SERVICE_SENSITIVE_DATA_PERMISSION'
AUDIO_NEW=NEW+'.libaudioipc_sensitive_data_provider_fix.AUDIO_SERVICE_SENSITIVE_DATA_PERMISSION'

def transform(events):
    out=[]; stack=[]; changes=0; inserted=False
    for e in events:
        if e[0]==258:
            _,comment,pair,indices,attrs=e; tag=pair[1];stack.append(pair)
            new=[]
            for ns,key,rid,raw,(typ,value) in attrs:
                nxt=value
                if tag=='manifest':
                    mapping={'versionCode':(4839,4954),'compileSdkVersion':(33,36),'compileSdkVersionCodename':('13','16'),'platformBuildVersionCode':(33,36),'platformBuildVersionName':(13,16),'package':(OLD,NEW)}
                    if key in mapping:
                        before,after=mapping[key]; require(value==before,'unexpected manifest metadata');nxt=after
                elif tag=='application' and key=='allowBackup':
                    require(typ==18 and value==0xffffffff,'unexpected backup flag');nxt=0
                elif typ==3 and ((tag in ('permission','uses-permission') and key=='name') or key in ('authorities','permission','readPermission','writePermission')):
                    if value.startswith(OLD+'.'):nxt=NEW+value[len(OLD):]
                    elif value==AUDIO_OLD:nxt=AUDIO_NEW
                if nxt!=value:
                    require(raw is None or (typ==3 and raw==value),'unexpected raw representation');raw=nxt if raw is not None else None;changes+=1
                new.append((ns,key,rid,raw,(typ,nxt)))
            out.append((258,comment,pair,indices,new))
        elif e[0]==259:
            require(stack and stack.pop()==e[2],'unexpected nesting')
            if e[2]==(None,'application'):
                require(not inserted and stack==[(None,'manifest')],'unexpected application location')
                def attr(key,rid,typ,value):return (ANDROID,key,rid,value if typ==3 else None,(typ,value))
                for tag,attrs in [('activity',[attr('theme',0x01010000,1,2131952775),attr('name',0x01010003,3,'com.vk.id.captcha.web.VKCaptchaWebViewActivity'),attr('exported',0x01010010,18,0),attr('launchMode',0x0101001d,16,2)]),('provider',[attr('name',0x01010003,3,'com.vk.id.captcha.init.SdkInitContentProvider'),attr('exported',0x01010010,18,0),attr('authorities',0x01010018,3,NEW+'.com.vk.id.captcha.init.provider')])]:
                    out.extend([(258,None,(None,tag),(0,0,0),attrs),(259,None,(None,tag))])
                inserted=True
            out.append(e)
        else:out.append(e)
    require(not stack and inserted,'incomplete manifest');return out,changes

def encode(events):
    # Use separate pool entries for equal strings with different attribute IDs.
    # Put mapped attribute names first so resource map is a dense prefix.
    mapped=sorted({(a[1],a[2]) for e in events if e[0]==258 for a in e[4] if a[2]},key=lambda x:(x[1],x[0]))
    items=list(mapped);index={v:i for i,v in enumerate(items)}
    def ix(s,rid=0):
        if s is None:return NONE
        k=(s,rid)
        if k not in index:index[k]=len(items);items.append(k)
        return index[k]
    def chunk(t,h,payload):
        require((8+len(payload))%4==0,'alignment');return struct.pack('<HHI',t,h,8+len(payload))+payload
    def val(v):
        typ,data=v;return struct.pack('<HBBI',8,0,typ,ix(data) if typ==3 else data)
    nodes=[]
    for e in events:
        t,comment=e[:2];p=struct.pack('<II',0,ix(comment))
        if t in (256,257,259):p+=struct.pack('<II',*(ix(s) for s in e[2]))
        elif t==258:
            p+=struct.pack('<II6H',ix(e[2][0]),ix(e[2][1]),20,20,len(e[4]),*e[3])
            for ns,k,rid,raw,v in e[4]:p+=struct.pack('<III',ix(ns),ix(k,rid),ix(raw))+val(v)
        elif t==260:p+=struct.pack('<I',ix(e[2]))+val(e[3])
        else:raise ValueError('unsupported event')
        nodes.append(chunk(t,16,p))
    payload=b'';offsets=[]
    for s,_ in items:
        offsets.append(len(payload));b=s.encode('utf-16le');n=len(b)//2;require(n<32768,'long string unsupported');payload+=struct.pack('<H',n)+b+b'\0\0'
    payload+=b'\0'*(-len(payload)%4)
    sp=chunk(1,28,struct.pack('<5I',len(items),0,0,28+4*len(items),0)+struct.pack('<'+'I'*len(offsets),*offsets)+payload)
    rm=chunk(0x180,8,b''.join(struct.pack('<I',rid) for _,rid in mapped))
    result=chunk(3,8,sp+rm+b''.join(nodes));require(canonical(result)==events,'encoding roundtrip mismatch');return result

def replay(base,out,release=None):
    require(sha(base.read_bytes())==BASE,'Wrong original APK');require(not out.exists(),'Output exists')
    with zipfile.ZipFile(base) as z:
        require(z.namelist().count('AndroidManifest.xml')==1,'manifest count');events=canonical(z.read('AndroidManifest.xml'))
    patched,n=transform(events);result=encode(patched)
    if release is not None:
        require(sha(release.read_bytes())==TARGET,'Wrong release APK')
        with zipfile.ZipFile(release) as z:
            require(z.namelist().count('AndroidManifest.xml')==1,'manifest count');ref=z.read('AndroidManifest.xml')
        require(canonical(ref)==patched,'Release canonical mismatch');print('RELEASE_CANONICAL_PASS', 'byte_equal',result==ref)
    with out.open('xb') as f:f.write(result)
    print('MANIFEST_REPLAY_PASS',n,'attribute changes, 2 non-exported components',sha(result))
if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('base',type=Path);p.add_argument('output',type=Path);p.add_argument('--release',type=Path);a=p.parse_args();replay(a.base,a.output,a.release)
