#!/usr/bin/env python3
"""Reconstruct five historical v4954 privacy changes from the local base.
No original method bodies, credentials, keys or user data are distributed.
"""
import argparse
import json
import re
from pathlib import Path
from patch_package import BASE_SHA, RELEASE_SHA, LINE, sha

RULES = {
    'com/vk/api/sdk/okhttp/LoggingInterceptor$delegate$2$a.smali': ('public log(Ljava/lang/String;)V', None),
    'com/vk/auth/api/models/AuthCredentials.smali': ('public toString()Ljava/lang/String;', 'AuthCredentials'),
    'com/vk/auth/api/models/AuthResult.smali': ('public toString()Ljava/lang/String;', 'AuthResult'),
    'com/vk/auth/base/BaseAuthObserver.smali': ('public a(Lcom/vk/auth/api/models/AuthResult;)V', None),
    'com/vk/auth/t/c/SmartLockHelper.smali': ('public b(Lcom/vk/auth/api/models/AuthCredentials;)V', None),
}

def transform(text, signature, redact):
    body = '    .registers 2\n\n'
    if redact:
        body += f'    const-string v0, "{redact}([REDACTED])"\n\n    return-object v0\n'
    else:
        body += '    return-void\n'
    pattern = r'(?m)^\.method ' + re.escape(signature) + r'\n[\s\S]*?^\.end method\n'
    text, count = re.subn(pattern, lambda _: '.method ' + signature + '\n' + body + '.end method\n', text)
    if count != 1: raise ValueError('Method is not unique')
    return LINE.sub('', text)

def apply(apk, decoded, output, manifest):
    if sha(apk.read_bytes()) != BASE_SHA: raise ValueError('Wrong original APK')
    if output.exists(): raise ValueError('Output already exists')
    spec = json.loads(manifest.read_text())
    if spec['base_apk_sha256'] != BASE_SHA or spec['release_apk_sha256'] != RELEASE_SHA: raise ValueError('Wrong manifest')
    if set(spec['classes']) != set(RULES): raise ValueError('Wrong class set')
    staged = {}
    for rel, (signature, redact) in RULES.items():
        pin = spec['classes'][rel]
        raw = (decoded / 'classes2' / rel).read_bytes()
        if sha(raw) != pin['base_sha256']: raise ValueError('Wrong source: ' + rel)
        data = transform(raw.decode('utf-8'), signature, redact).encode('utf-8')
        if sha(data) != pin['target_sha256']: raise ValueError('Output mismatch: ' + rel)
        staged[rel] = data
    output.mkdir(parents=True)
    for rel, data in staged.items():
        path = output / 'classes2' / rel
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
    return len(staged)

if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('original_apk', type=Path)
    p.add_argument('decoded_root', type=Path)
    p.add_argument('output', type=Path)
    p.add_argument('--manifest', type=Path, default=Path(__file__).with_name('privacy_manifest.json'))
    a = p.parse_args()
    print('PRIVACY_CLASS_REPLAY_PASS', apply(a.original_apk, a.decoded_root, a.output, a.manifest))
