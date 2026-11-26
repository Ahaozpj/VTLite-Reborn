#!/usr/bin/env python3
"""Apply verified v4954 package-literal changes to a local, exact base.
Does not distribute vendor Smali, assemble an APK, sign, or install it.
"""
import argparse
import hashlib
import json
import re
from pathlib import Path

BASE_SHA = '2c312fecefce700bae0a956227f79474a6e17da64e93f22f0cb98d4e0436bb30'
RELEASE_SHA = '5f6f67d33141e398e97f951f68a83fa35d1c02bedf99a2e31f2bb714b521a3a8'
PACKAGE = re.compile(r'(?m)^([ \t]*const-string(?:/jumbo)? [vp]\d+, ")com\.vtosters\.lite((?:\.[A-Za-z0-9_$]+)*")$')
LINE = re.compile(r'(?m)^[ \t]*\.line [0-9]+\n')
SLOT = re.compile(r'classes[2-7]?\Z')
CLASS = re.compile(r'L[A-Za-z0-9_$/]+;\Z')

def sha(b): return hashlib.sha256(b).hexdigest()

def transform(text, mode):
    if mode == 'strip_line': text = LINE.sub('', text)
    elif mode != 'preserve': raise ValueError('Unknown transform')
    return PACKAGE.subn(r'\g<1>com.vtosters.reborn\g<2>', text)

def apply(apk, decoded, output, manifest):
    if sha(apk.read_bytes()) != BASE_SHA: raise ValueError('Wrong original APK')
    if output.exists(): raise ValueError('Output already exists')
    spec = json.loads(manifest.read_text())
    if spec['base_apk_sha256'] != BASE_SHA or spec['release_apk_sha256'] != RELEASE_SHA: raise ValueError('Wrong manifest')
    if len(spec['classes']) != 85: raise ValueError('Wrong class count')
    staged = {}
    for e in spec['classes']:
        slot, cls = e['key'].split('|')
        if not SLOT.fullmatch(slot) or not CLASS.fullmatch(cls): raise ValueError('Invalid class path')
        rel = Path(slot) / (cls[1:-1] + '.smali')
        if rel in staged: raise ValueError('Duplicate class')
        raw = (decoded / rel).read_bytes()
        if sha(raw) != e['base_sha256']: raise ValueError('Wrong source: ' + str(rel))
        result, count = transform(raw.decode('utf-8'), e['mode'])
        data = result.encode('utf-8')
        if count != e['replacements'] or count < 1 or sha(data) != e['target_sha256']: raise ValueError('Output mismatch: ' + str(rel))
        staged[rel] = data
    # All class gates must pass before creating output.
    output.mkdir(parents=True)
    for rel, data in staged.items():
        path = output / rel
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
    return len(staged)

if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('original_apk', type=Path)
    p.add_argument('decoded_root', type=Path)
    p.add_argument('output', type=Path)
    p.add_argument('--manifest', type=Path, default=Path(__file__).with_name('package_manifest.json'))
    a = p.parse_args()
    print('PACKAGE_CLASS_REPLAY_PASS', apply(a.original_apk, a.decoded_root, a.output, a.manifest))
