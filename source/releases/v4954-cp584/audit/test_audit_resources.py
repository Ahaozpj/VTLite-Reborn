import struct, unittest
from audit_resources import canonical, NONE

def chunk(t, h, content):
    assert (8+len(content))%4==0
    return struct.pack('<HHI',t,h,8+len(content))+content

def xml(strings=('node','attr','value'),utf8=True,typ=3,data='value',rid=0x1010001,raw='value',line=1,extra=b''):
    offsets=[];payload=b''
    for s in strings:
        offsets.append(len(payload));u=s.encode('utf-16le');n=len(u)//2
        if utf8:
            b=s.encode('utf-8');payload+=bytes([n,len(b)])+b+b'\0'
        else:payload+=struct.pack('<H',n)+u+b'\0\0'
    payload+=b'\0'*((-len(payload))%4)
    ix=lambda s:strings.index(s) if s is not None else NONE
    p=chunk(1,28,struct.pack('<5I',len(strings),0,256 if utf8 else 0,28+4*len(strings),0)+struct.pack('<'+'I'*len(strings),*offsets)+payload)
    m=chunk(0x180,8,struct.pack('<'+'I'*len(strings),*[rid if s=='attr' else 0 for s in strings]))
    nd=struct.pack('<II',line,NONE)
    e=chunk(0x102,16,nd+struct.pack('<II6H',NONE,ix('node'),20,20,1,0,0,0)+struct.pack('<IIIHBBI',NONE,ix('attr'),ix(raw),8,0,typ,ix(data) if typ==3 else data))
    end=chunk(0x103,16,nd+struct.pack('<II',NONE,ix('node')))
    return chunk(3,8,p+m+e+extra+end)
class AuditTests(unittest.TestCase):
    def test_encoding(self):self.assertEqual(canonical(xml()),canonical(xml(utf8=False)))
    def test_pool_order(self):self.assertEqual(canonical(xml()),canonical(xml(('value','attr','node'))))
    def test_line(self):self.assertEqual(canonical(xml()),canonical(xml(line=42)))
    def test_id(self):self.assertNotEqual(canonical(xml()),canonical(xml(rid=0x1010002)))
    def test_raw(self):self.assertNotEqual(canonical(xml()),canonical(xml(raw=None)))
    def test_type(self):self.assertNotEqual(canonical(xml()),canonical(xml(typ=16,data=2)))
    def test_data(self):self.assertNotEqual(canonical(xml(typ=16,data=1)),canonical(xml(typ=16,data=2)))
    def test_unknown(self):
        with self.assertRaises(ValueError):canonical(xml(extra=chunk(0x106,8,b'')))
    def test_truncated(self):
        with self.assertRaises(ValueError):canonical(xml()[:-4])
    def test_unbalanced(self):
        b=xml();b=bytearray(b[:-24]);struct.pack_into('<I',b,4,len(b))
        with self.assertRaises(ValueError):canonical(b)
    def test_supplementary(self):self.assertEqual(canonical(xml(('node','attr','😀'),data='😀',raw='😀')),canonical(xml(('node','attr','😀'),utf8=False,data='😀',raw='😀')))
if __name__=='__main__':unittest.main(verbosity=2)
