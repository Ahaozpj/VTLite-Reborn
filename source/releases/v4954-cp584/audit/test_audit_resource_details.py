import io, struct, unittest
from PIL import Image
from audit_resource_details import namespace_only,png_summary,table_layout
N=(256,None,('a','uri')); E=(257,None,('a','uri')); R=(258,None,(None,'root'),(0,0,0),[]); C=(259,None,(None,'root'))
class Tests(unittest.TestCase):
    def test_namespace(self):self.assertTrue(namespace_only([N,R,C,E],[R,C]))
    def test_equal(self):self.assertFalse(namespace_only([R,C],[R,C]))
    def test_changed_attribute(self):self.assertFalse(namespace_only([N,R,C,E],[(258,None,(None,'root'),(0,0,0),[('uri','x',1,None,(16,1))]),C]))
    def test_changed_comment(self):self.assertFalse(namespace_only([(256,'comment',('a','uri')),R,C,E],[R,C]))
    def test_added_namespace(self):self.assertFalse(namespace_only([R,C],[N,R,C,E]))
    def test_png(self):
        def png(color,mode='RGBA'):
            f=io.BytesIO();Image.new(mode,(2,2),color).save(f,format='PNG');return f.getvalue()
        self.assertTrue(png_summary(png((1,2,3,255)),png((1,2,3),'RGB'))['rgba_equal'])
        self.assertFalse(png_summary(png((1,2,3,255)),png((1,2,4,255)))['rgba_equal'])
    def test_png_bad(self):
        with self.assertRaises(Exception):png_summary(b'bad',b'bad')
    def test_table(self):
        b=struct.pack('<HHI I HHI',2,12,20,1,0x200,8,8);self.assertEqual(table_layout(b)['packages'],1)
    def test_table_bad_count(self):
        b=struct.pack('<HHI I HHI',2,12,20,2,0x200,8,8)
        with self.assertRaises(ValueError):table_layout(b)
    def test_table_truncated(self):
        with self.assertRaises(ValueError):table_layout(struct.pack('<HHII',2,12,20,1))
if __name__=='__main__':unittest.main(verbosity=2)
