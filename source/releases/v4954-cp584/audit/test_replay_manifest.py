import unittest, tempfile
from pathlib import Path
from replay_manifest import transform,encode,replay,ANDROID,OLD,NEW
from audit_resources import canonical

def a(key,typ,value,ns=ANDROID,rid=0):return ns,key,rid,value if typ==3 else None,(typ,value)
def start(tag,attrs):return (258,None,(None,tag),(0,0,0),attrs)
def end(tag):return (259,None,(None,tag))
def fixture():
    return [(256,None,('android',ANDROID)),start('manifest',[a('package',3,OLD,None),a('versionCode',16,4839),a('compileSdkVersion',16,33),a('compileSdkVersionCodename',3,'13'),a('platformBuildVersionCode',16,33,None),a('platformBuildVersionName',16,13,None)]),start('uses-permission',[a('name',3,OLD+'.permission.ACCESS_DATA')]),end('uses-permission'),start('application',[a('allowBackup',18,0xffffffff),a('name',3,OLD+'.VKApplication')]),start('provider',[a('name',3,OLD+'.Provider'),a('authorities',3,OLD+'.example'),a('exported',18,0)]),end('provider'),end('application'),end('manifest'),(257,None,('android',ANDROID))]
class Tests(unittest.TestCase):
    def test_roundtrip(self):self.assertEqual(canonical(encode(fixture())),fixture())
    def test_transform(self):
        e,n=transform(fixture());self.assertEqual(n,9);self.assertEqual(canonical(encode(e)),e)
        self.assertIn(a('name',3,OLD+'.VKApplication'),e[4][4]);self.assertIn(a('allowBackup',18,0),e[4][4]);self.assertIn(a('authorities',3,NEW+'.example'),e[5][4])
    def test_insertions(self):
        e,_=transform(fixture());added=[x for x in e if x[0]==258 and x[2][1] in ('activity','provider') and any('com.vk.id.captcha' in str(v[4]) for v in x[4])];self.assertEqual(len(added),2);self.assertTrue(all(any(v[1]=='exported' and v[4]==(18,0) for v in x[4]) for x in added))
    def test_metadata_refusal(self):
        e=fixture();e[1][4][1]=a('versionCode',16,99)
        with self.assertRaises(ValueError):transform(e)
    def test_backup_refusal(self):
        e=fixture();e[4][4][0]=a('allowBackup',18,0)
        with self.assertRaises(ValueError):transform(e)
    def test_missing_application(self):
        with self.assertRaises(ValueError):transform([start('manifest',[]),end('manifest')])
    def test_duplicate_application(self):
        e=fixture();e[8:8]=[start('application',[]),end('application')]
        with self.assertRaises(ValueError):transform(e)
    def test_wrong_apk(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'fake.apk';p.write_bytes(b'bad');out=Path(d)/'manifest.xml'
            with self.assertRaisesRegex(ValueError,'Wrong original APK'):replay(p,out)
            self.assertFalse(out.exists())
    def test_distinct_resource_ids(self):
        e=[start('root',[a('name',3,'name',rid=0x1010003),a('name',3,'name',ns=None,rid=0)]),end('root')];self.assertEqual(canonical(encode(e)),e)
if __name__=='__main__':unittest.main(verbosity=2)
