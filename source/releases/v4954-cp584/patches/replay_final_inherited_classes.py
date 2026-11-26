#!/usr/bin/env python3
"""Replay a reviewed subset of Reborn v4954 changes on locally decoded original Smali.
No original class bodies, APKs, secrets or signing material are included.
"""
import argparse
import hashlib
import json
import re
from pathlib import Path

BASE = '2c312fecefce700bae0a956227f79474a6e17da64e93f22f0cb98d4e0436bb30'
TARGET = '5f6f67d33141e398e97f951f68a83fa35d1c02bedf99a2e31f2bb714b521a3a8'
PATH = re.compile(r'classes[2-7]?\|L[A-Za-z0-9_$/]+;\Z')
def sha(data): return hashlib.sha256(data).hexdigest()

def apply(apk, decoded, output, manifest):
    if sha(apk.read_bytes()) != BASE: raise ValueError('Wrong original APK')
    if output.exists(): raise ValueError('Output already exists')
    spec = json.loads(manifest.read_text())
    if spec['base_apk_sha256'] != BASE or spec['release_apk_sha256'] != TARGET or len(spec['classes']) != 4:
        raise ValueError('Wrong manifest scope')
    staged = {}
    for entry in spec['classes']:
        key = entry['key']
        if not PATH.fullmatch(key): raise ValueError('Invalid class path')
        slot, cls = key.split('|')
        rel = Path(slot) / (cls[1:-1] + '.smali')
        if rel in staged: raise ValueError('Duplicate class')
        src = (decoded / rel).read_bytes()
        if sha(src) != entry['base_sha256']: raise ValueError('Wrong source: ' + key)
        lines = src.decode('utf-8').splitlines(keepends=True)
        chunks = []
        for op in entry['operations']:
            if op[0] == 'copy' and len(op) == 3:
                i, n = op[1:]
                if type(i) is not int or type(n) is not int or i < 0 or n < 1 or i+n > len(lines): raise ValueError('Invalid copy range')
                chunks.extend(lines[i:i+n])
            elif op[0] == 'literal' and len(op) == 2 and isinstance(op[1],str):
                chunks.append(op[1])
            else: raise ValueError('Invalid operation')
        result = ''.join(chunks).encode('utf-8')
        if sha(result) != entry['target_sha256']: raise ValueError('Output mismatch: ' + key)
        staged[rel] = result
    output.mkdir(parents=True)
    for rel, data in staged.items():
        dst = output / rel
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_bytes(data)
    return len(staged)

if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('original_apk', type=Path)
    p.add_argument('decoded_root', type=Path)
    p.add_argument('output', type=Path)
    p.add_argument('--manifest',type=Path,default=Path(__file__).with_name('final_inherited_replay_manifest.json'))
    a=p.parse_args()
    print('CLASS_REPLAY_PASS',apply(a.original_apk,a.decoded_root,a.output,a.manifest))
