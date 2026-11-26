import struct, unittest
from audit_resource_table import strings,parse,compare,NONE

def chunk(t,h,payload):
    assert (8+len(payload))%4==0
    return struct.pack('<HHI',t,h,8+len(payload))+payload

def pool(ss,utf8=True,styled=False):
    offs=[];data=b''
    for s in ss:
        offs.append(len(data));u=s.encode('utf-16le');v=s.encode('utf-8');data+=(bytes([len(u)//2,len(v)])+v+b'\0') if utf8 else struct.pack('<H',len(u)//2)+u+b'\0\0'
    data+=b'\0'*((-len(data))%4);start=28+4*(len(ss)+int(styled));sty=start+len(data) if styled else 0
    span=struct.pack('<4I',1,0,0,NONE) if styled else b''
    return chunk(1,28,struct.pack('<5I',len(ss),int(styled),256 if utf8 else 0,start,sty)+struct.pack('<'+'I'*len(offs),*offs)+(struct.pack('<I',0) if styled else b'')+data+span)

def table(typ=3,data=0,flags=2,utf8=True,ss=('value','b'),styled=False,specflag=0,specheader=0,config=0,bag=False,unknown=False):
    gp=pool(ss,utf8,styled);tp=pool(('string',));kp=pool(('name',));sp=chunk(0x202,16,struct.pack('<BBHII',1,0,specheader,1,specflag));val=struct.pack('<HBBI',8,0,typ,data)
    e=struct.pack('<HHI',16 if bag else 8,flags|int(bag),0)+(struct.pack('<III',0,1,0x1010000) if bag else b'')+val
    cf=struct.pack('<II',64,config)+bytes(56)
    tc=chunk(0x201,84,struct.pack('<BBHII',1,0,0,1,88)+cf+struct.pack('<I',0)+e)
    name='example'.encode('utf-16le').ljust(256,b'\0');pkg=chunk(0x200,288,struct.pack('<I',127)+name+struct.pack('<5I',288,0,288+len(tp),0,0)+tp+kp+sp+tc+(chunk(0x999,8,b'') if unknown else b''));return chunk(2,12,struct.pack('<I',1)+gp+pkg)
class Tests(unittest.TestCase):
    def comp(self,x,y):return compare(parse(x),parse(y))
    def test_encoding(self):self.assertEqual(self.comp(table(),table(utf8=False))['equal_entries'],1)
    def test_string_order(self):self.assertEqual(self.comp(table(),table(ss=('b','value'),data=1))['equal_entries'],1)
    def test_string_value(self):self.assertEqual(self.comp(table(),table(ss=('different','b')))['entry_payload_changed'],1)
    def test_type(self):self.assertEqual(self.comp(table(),table(typ=16))['entry_payload_changed'],1)
    def test_flags(self):self.assertEqual(self.comp(table(),table(flags=6))['entry_flags_only'],1)
    def test_spec_header(self):self.assertEqual(self.comp(table(),table(specheader=1))['changed_type_spec_headers'],1);self.assertEqual(self.comp(table(),table(specheader=1))['changed_spec_slots'],0)
    def test_spec_flag(self):self.assertEqual(self.comp(table(),table(specflag=4))['changed_spec_slots'],1)
    def test_config(self):r=self.comp(table(),table(config=1));self.assertEqual((r['added_entries'],r['removed_entries']),(1,1))
    def test_style(self):self.assertEqual(self.comp(table(),table(styled=True))['entry_payload_changed'],1)
    def test_bag(self):self.assertEqual(self.comp(table(bag=True),table(bag=True))['equal_entries'],1)
    def test_bad_index(self):
        with self.assertRaises(ValueError):parse(table(data=9))
    def test_unknown(self):
        with self.assertRaises(ValueError):parse(table(unknown=True))
    def test_truncation(self):
        with self.assertRaises(ValueError):parse(table()[:-4])
if __name__=='__main__':unittest.main(verbosity=2)
