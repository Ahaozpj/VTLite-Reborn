# CP584 v4954 — secure-storage integration and canonical replay audit

This stage recovers four inherited-class deltas: VKAuthManager, VKAccessToken, VK and SharedPrefsCookiePersistor. The reviewed changes route the client's local token/cookie storage through the previously published encrypted storage adapters, disable legacy plaintext token persistence and retain existing SDK operations. Only replay instructions are published, not inherited class bodies. The original APK and the release APK remain pinned by SHA-256 in the manifest.

## Reproduction

Run each of the seven patch scripts in `patches/verify_replay_union.py` against the same unchanged, locally disassembled original APK. Use separate output directories named after each script (without .py), under one replay root. Then run `python patches/verify_replay_union.py REPLAY_ROOT`. Do not apply these scripts in series to the output of another script: their input is the original class. Overlapping outputs may be deduplicated only after exact equality is verified.

## Corrected cumulative counts

The previous 121 figure counted five overlapping inherited class entries twice: one logging class in privacy/media and four package compatibility classes in component/media. Normalization to DEX directory + class path resolves the differing manifest formats. All seven scripts were actually executed again on the pinned original, each output compared byte-for-byte with the release. The 125 output entries represent 120 unique classes, including four newly recovered classes. The five duplicate results match byte-for-byte. The four new classes also passed isolated Smali assembly/disassembly 4/4. All 97 previously published first-party class files were independently matched against the release inventory and decoded files. The union verifier rejected four intentionally invalid indexes (hash, missing class, count, script owner).

Corrected prior coverage: 116/167 inherited + 97/113 new. Current: 120/167 inherited + 97/113 new = 217/280 unique class entries. Remaining 47 inherited, 16 new candidates, resource/dependency review and full build. No original code bodies, signing material, user credentials or private logs are included. No new APK, Android runtime test, full build or tag update. This audit is not a complete security review or proof of functioning login.
