from pathlib import Path
import hashlib,zipfile,json,sys,re
from stage_versioned import patch,field,dex_header
from pack_cp390 import pack,verify
base,dex,out=map(Path,sys.argv[1:]); sha=lambda b:hashlib.sha256(b).hexdigest()
assert sha(base.read_bytes())=='68221758860b23ad771b31091365fb828d51da3902305d94c4ce4cdd60cc79e2'
assert sha(dex.read_bytes())=='2a0a6366c9f4876efdfda650c4807d3478aa000f412cfecd892e6acefc947200'
with zipfile.ZipFile(base) as z: repl={'AndroidManifest.xml':patch(z.read('AndroidManifest.xml'),4953,4954),'classes3.dex':dex.read_bytes()}
pack(base,out,repl);r=verify(base,out,repl,4954);r['baseline_sha256']=sha(base.read_bytes())
with zipfile.ZipFile(out) as z:
 names=[n for n in z.namelist() if re.fullmatch(r'classes\d*\.dex',n)];assert len(names)==10 and all(dex_header(z.read(n)) for n in names);assert field(z.read('AndroidManifest.xml'))[1]==4954
r['all_10_dex_headers_verified']=True
Path('pack.json').write_text(json.dumps(r,indent=2));print(r)
