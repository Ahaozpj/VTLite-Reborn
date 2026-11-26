#!/usr/bin/env python3
"""Apply four v4954 component-package fixes to a user-supplied local base.
No vendor class bodies or APK are distributed here. No signing or installation.
"""
import argparse
import hashlib
import json
import re
from pathlib import Path

BASE = '2c312fecefce700bae0a956227f79474a6e17da64e93f22f0cb98d4e0436bb30'
TARGET = '5f6f67d33141e398e97f951f68a83fa35d1c02bedf99a2e31f2bb714b521a3a8'
RULES = {
    'classes4/com/vk/profile/ui/BaseProfileFragment.smali': (
        ('android-app://com.vtosters.lite/', 'android-app://com.vtosters.reborn/', 1),
        ('"com.vtosters.lite.permission.ACCESS_DATA"', '"com.vtosters.reborn.permission.ACCESS_DATA"', 2),
    ),
    'classes2/com/vk/common/links/BrowserUtils$Companion.smali': (
        ('    const-string v0, "com.vtosters.lite"\n',
         '    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;\n\n    move-result-object v0\n', 1),
    ),
    'classes4/com/vk/voip/VoipAppBindingFactory$createVoipAppBinding$3.smali': (
        ('android.resource://com.vtosters.lite/', 'android.resource://com.vtosters.reborn/', 1),
    ),
    'classes6/ru/vtosters/lite/ui/fragments/tgstickers/StickersFragment.smali': (
        ('"com.vtosters.lite.action.RELOAD_TGS_LIST"', '"com.vtosters.reborn.action.RELOAD_TGS_LIST"', 1),
    ),
}

def sha(b): return hashlib.sha256(b).hexdigest()

def transform(path, raw):
    text = raw.decode('utf-8')
    for old, new, count in RULES[path]:
        if text.count(old) != count:
            raise ValueError('Unexpected occurrence count: ' + path)
        text = text.replace(old, new)
    if path == 'classes2/com/vk/common/links/BrowserUtils$Companion.smali':
        text = re.sub(r'(?m)^[ \t]*\.line [0-9]+\n', '', text)
    return text.encode('utf-8')

def apply(apk, decoded, output, manifest):
    if sha(apk.read_bytes()) != BASE: raise ValueError('Wrong base APK')
    if output.exists(): raise ValueError('Output already exists')
    spec = json.loads(manifest.read_text())
    if spec['base_apk_sha256'] != BASE or spec['release_apk_sha256'] != TARGET or set(spec['classes']) != set(RULES):
        raise ValueError('Wrong manifest scope')
    staged = {}
    for rel in RULES:
        entry = spec['classes'][rel]
        raw = (decoded / rel).read_bytes()
        if sha(raw) != entry['base_sha256']: raise ValueError('Wrong class: ' + rel)
        result = transform(rel, raw)
        if sha(result) != entry['target_sha256']: raise ValueError('Target mismatch: ' + rel)
        staged[rel] = result
    # Validate every class before writing any output.
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
    p.add_argument('--manifest', type=Path, default=Path(__file__).with_name('component_package_manifest.json'))
    a = p.parse_args()
    print('COMPONENT_PACKAGE_REPLAY_PASS', apply(a.original_apk, a.decoded_root, a.output, a.manifest))
