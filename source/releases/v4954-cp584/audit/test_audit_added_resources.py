import copy,json,os,unittest,zipfile
from pathlib import Path
from audit_added_resources import classify,read_r_fields,parse
class Tests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.m=json.loads(Path(__file__).with_name('resource_dependencies.json').read_text())
        with zipfile.ZipFile(os.environ['CP584_BASE_APK']) as a,zipfile.ZipFile(os.environ['CP584_RELEASE_APK']) as b:
            cls.a,cls.b=[parse(z.read('resources.arsc')) for z in (a,b)]
            cls.paths={n for n in set(b.namelist())-set(a.namelist()) if n.startswith('res/')}
    def test_real(self):self.assertEqual(classify(self.a,self.b,self.m,self.paths)['captcha']['ids'],24)
    def test_wrong_owner(self):
        m=copy.deepcopy(self.m);m['androidx_new_names'][0],m['captcha_new_names'][0]=m['captcha_new_names'][0],m['androidx_new_names'][0]
        with self.assertRaises(ValueError):classify(self.a,self.b,m,self.paths)
    def test_missing_name(self):
        m=copy.deepcopy(self.m);m['androidx_new_names'].pop()
        with self.assertRaises(ValueError):classify(self.a,self.b,m,self.paths)
    def test_wrong_r(self):
        m=copy.deepcopy(self.m);m['captcha_r_fields']['id/webview']='0x7f0a0af1'
        with self.assertRaises(ValueError):classify(self.a,self.b,m,self.paths)
    def test_renamed_old(self):
        b=dict(self.b,names=dict(self.b['names']));b['names'][next(iter(self.a['names']))]=('id','wrong')
        with self.assertRaises(ValueError):classify(self.a,b,self.m,self.paths)
    def test_unknown_file(self):
        with self.assertRaises(ValueError):classify(self.a,self.b,self.m,self.paths|{'res/drawable/unexpected.png'})
    def test_missing_file(self):
        with self.assertRaises(ValueError):classify(self.a,self.b,self.m,self.paths-{next(iter(self.paths))})
if __name__=='__main__':unittest.main()
