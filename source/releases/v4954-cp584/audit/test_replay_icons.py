import tempfile, unittest
from pathlib import Path
from PIL import Image
from replay_icons import render, artwork, generate, PATHS
class Tests(unittest.TestCase):
    def setUp(self):self.im=Image.new('RGBA',(256,256),(123,45,67,255))
    def test_normal(self):self.assertEqual(render(self.im,48,48,'normal').getpixel((0,0)),(123,45,67))
    def test_round(self):
        r=render(self.im,192,192,'round');self.assertEqual(r.getpixel((0,0)),(0,0,0,0));self.assertEqual(r.getpixel((96,96)),(123,45,67,255))
    def test_adaptive(self):
        r=render(self.im,200,200,'adaptive');self.assertEqual(r.getchannel('A').getbbox(),(28,28,172,172));self.assertEqual(r.getpixel((0,0)),(0,0,0,0))
    def test_unknown(self):
        with self.assertRaises(ValueError):render(self.im,48,48,'other')
    def test_bad_source(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'a.png';self.im.save(p)
            with self.assertRaisesRegex(ValueError,'Wrong Phoenix artwork'):artwork(p)
    def test_existing(self):
        with tempfile.TemporaryDirectory() as d:
            with self.assertRaisesRegex(ValueError,'Output already exists'):generate(Path(d)/'missing',Path(d))
    def test_paths(self):self.assertEqual(len(PATHS),7)
if __name__=='__main__':unittest.main(verbosity=2)
