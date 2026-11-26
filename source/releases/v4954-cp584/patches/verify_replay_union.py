#!/usr/bin/env python3
"""Check independently replayed CP584 patch outputs, count each DEX/class once.
Run each patch script against the unchanged original decoded tree, not in series.
This checker does not assemble or sign an APK.
"""
import argparse, hashlib, json, re
from pathlib import Path

SCRIPTS = ('patch_package','patch_privacy','patch_component_package','replay_reviewed_classes','replay_ui_classes','replay_media_classes','replay_storage_classes','replay_stream_classes','replay_privacy_route_classes','replay_preferences_media_classes','replay_message_media_classes','replay_dialog_route_classes','replay_history_diag_classes','replay_error_auth_classes')

def verify(roots, index):
    expected = index['classes']; actual = {}; count = 0
    for name in SCRIPTS:
        root = roots / name
        if not root.is_dir(): raise ValueError('Missing replay directory: '+name)
        for f in root.rglob('*.smali'):
            key = f.relative_to(root).as_posix()
            if not re.fullmatch(r'classes[2-7]?/[A-Za-z0-9_$/]+\.smali',key) or key not in expected:
                raise ValueError('Unexpected class: '+key)
            h = hashlib.sha256(f.read_bytes()).hexdigest()
            if h != expected[key]['target_sha256'] or name not in expected[key]['patches']:
                raise ValueError('Unexpected source or hash: '+key)
            actual.setdefault(key,[]).append(name); count += 1
    if set(actual)!=set(expected) or any(sorted(actual[k])!=sorted(expected[k]['patches']) for k in expected):
        raise ValueError('Incomplete or inconsistent patch union')
    if count!=index['patch_entries'] or len(actual)!=index['unique_inherited']:
        raise ValueError('Count mismatch')
    return len(actual),count

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('replay_roots',type=Path)
    p.add_argument('--index',type=Path,default=Path(__file__).with_name('class_replay_index.json'))
    a=p.parse_args();u,n=verify(a.replay_roots,json.loads(a.index.read_text()))
    print(f'UNION_PASS unique={u} entries={n} duplicates={n-u}')
