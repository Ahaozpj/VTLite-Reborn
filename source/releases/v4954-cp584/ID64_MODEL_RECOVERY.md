# CP584 v4954 — ID64 first-party class families

This is a partial recovery of first-party changes, not a complete APK build. The pinned original APK and published v4954 APK were hash-verified before extraction. The 19 Smali files in this supplement are the exact release disassembly, not a claim that earlier Java files rebuild the release unchanged. No original VK/VTLite class bodies or binary dependencies are distributed.

## Provenance

Historical first-party Java sources were recovered from the project library and reviewed alongside the released classes. The families are `LosslessResponseShadow` (CP346 onward), `DialogPageModel` (CP351 onward), `ProfileEntryAudit` (CP358 onward) and `ScopedDialogDelivery`. Historical Java file SHA-256 values (not hashes of the release Smali):

- `DialogPageModel.java`: `3fae9bd5e1618835f8e371b6a8821f8b4b539640b2033796b84b3c72d3182685`
- `LosslessResponseShadow.java`: `6ff5ccaf9b4eeaaa3cce60671fb39ac4e2057cf0c0d33b90d219b6a7fb1e39e3`
- `ProfileEntryAudit.java`: `875666f4bdfa5546d7bfd8d0065a284d476634605821dfedaa9d59dbaeb01414`
- `ScopedDialogDelivery.java`: `d367e894fc415363418989b9d31e2afd9abd2ef694e39d538ff02d4b5d49e116`

The DialogPageModel Java hash also matches the saved CP351 checksum manifest. LosslessResponseShadow is an earlier revision (its hash differs from CP351); the historical Java files are provenance references, not supplied as exact build inputs. The release families have subsequently evolved.

## Verification

- 19/19 classes match the private release inventory and exact v4954 disassembly.
- 19/19 match again after isolated smali/baksmali 3.0.10 assembly and disassembly.
- All class descriptors are limited to Java, Dalvik annotations and Reborn ID64; reviewed fixed string literals contain no user data, credentials or raw URLs.
- The 19 classes do not overlap the previous 18 published own-class files; the 121 prior inherited-class entries are mutually disjoint across their manifests.
- Cumulative inventory coverage: 121/167 inherited class entries and 37/113 new-class candidates.

No full APK build, on-device test, or release tag was performed. Existing APK and tags are unchanged.
