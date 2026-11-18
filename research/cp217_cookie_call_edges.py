#!/usr/bin/env python3
"""Targeted call-site audit: class names, method names and invoked signatures only."""
import re, sys, zipfile
from pathlib import Path
from androguard.core.dex import DEX

APK=Path(sys.argv[1])
OUT=Path(sys.argv[2])
TARGETS={
    'Lcom/vtosters/lite/utils/CookieHelper;',
    'Lcom/vtosters/lite/activities/LogoutReceiver;',
    'Lcom/vtosters/lite/auth/VKSession;',
    'Lcom/vk/auth/AuthHelper;',
    'Lcom/vk/auth/main/UsersStore;',
    'Lcom/vk/core/network/cookies/persistence/SharedPrefsCookiePersistor;'
}
FOCUS=re.compile(r'cookie|session|logout|auth|webstorage|webview|sharedpreferences|userstore|persist',re.I)
SIGNATURE=re.compile(r'(L[a-zA-Z0-9_/$-]+;->[a-zA-Z0-9_$<>]+\([^)]*\)[a-zA-Z0-9_/$;\[]+)')
lines=['# CP217 - targeted DEX call-site audit','',
       'Source: unchanged CP205 v4850. Findings are static; runtime lifecycle behavior is not confirmed.','',
       'This report includes only method names and invoke targets. It does not log passwords, cookies or token values.','']
with zipfile.ZipFile(APK) as z:
    for name in ['classes2.dex','classes4.dex','classes5.dex']:
        d=DEX(z.read(name))
        classes=[c for c in d.get_classes() if c.get_name() in TARGETS]
        lines.extend(['## '+name,''])
        for c in classes:
            lines.append('### '+c.get_name())
            methods=list(c.get_methods())
            lines.append('Declared methods: '+str(len(methods)))
            for m in methods:
                calls=[]
                if m.get_code():
                    for ins in m.get_instructions():
                        if not ins.get_name().startswith('invoke-'):
                            continue
                        text=ins.get_output()
                        match=SIGNATURE.search(text)
                        if not match:
                            continue
                        target=match.group(1)
                        if FOCUS.search(target):
                            calls.append(target)
                if calls:
                    lines.append('- '+m.get_name()+' ('+m.get_descriptor()+') ->')
                    for t in sorted(set(calls)):
                        lines.append('  - '+t)
            lines.append('')
OUT.write_text('\n'.join(lines)+'\n',encoding='utf-8')
print('PASS: generated targeted DEX call-site report: '+str(OUT))
