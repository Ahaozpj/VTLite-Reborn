import unittest,struct
from replay_branding import *
from test_audit_resource_table import pool
class Tests(unittest.TestCase):
    def test_pool(self):
        p=pool(('other','VTLite','third')); self.assertEqual(strings(replace_pool_string(p,'VTLite','VTLite Reborn')),[('other',()),('VTLite Reborn',()),('third',())])
    def test_missing(self):
        with self.assertRaises(ValueError):replace_pool_string(pool(('other',)), 'VTLite','VTLite Reborn')
    def test_duplicate(self):
        with self.assertRaises(ValueError):replace_pool_string(pool(('VTLite','VTLite')), 'VTLite','VTLite Reborn')
    def test_utf16(self):
        with self.assertRaises(ValueError):replace_pool_string(pool(('VTLite',),utf8=False), 'VTLite','VTLite Reborn')
    def test_styles(self):
        p=pool(('value','b','VTLite'),styled=True); x=strings(replace_pool_string(p,'VTLite','VTLite Reborn'));self.assertEqual(x[0],('value',(('b',0,0),)));self.assertEqual(x[2],('VTLite Reborn',()))
    def test_style_name(self):
        with self.assertRaises(ValueError):replace_pool_string(pool(('value','VTLite'),styled=True), 'VTLite','VTLite Reborn')
    def test_bad_network(self):
        with self.assertRaises((ValueError,struct.error)):network(b'bad')
if __name__=='__main__':unittest.main(verbosity=2)
