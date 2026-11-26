#!/usr/bin/env python3
"""Restore the byte-exact original Phoenix PNG from its UTF-8 archive parts."""
import argparse, base64, hashlib
from pathlib import Path
EXPECTED = "a6ed9d91ab71dfbc60ce8df2514de6c67cba4dd0ee6126b3c50e2847eefb6842"
PARTS = 8
if __name__ == "__main__":
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('output',type=Path);a=p.parse_args()
    if a.output.exists(): raise ValueError('Output exists')
    root=Path(__file__).parent
    encoded=''.join((root/f'artwork_part_{i:02}.txt').read_text().strip() for i in range(PARTS))
    data=base64.b64decode(encoded,validate=True)
    if hashlib.sha256(data).hexdigest()!=EXPECTED: raise ValueError('Artwork SHA-256 mismatch')
    with a.output.open('xb') as f: f.write(data)
    print('PHOENIX_ARTWORK_SHA256_PASS')
