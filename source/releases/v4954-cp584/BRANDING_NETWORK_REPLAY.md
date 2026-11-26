# CP584 v4954 — reproducible branding and network configuration changes

This first-party local replay script requires authorized copies of both pinned original and released APKs. It does not distribute either APK, original resource tables, signing material or dependency code.

The previously audited eight changed typed resource payloads are precisely seven `string/app_name` entries (`VTLite` → `VTLite Reborn`, default and be/es/kk/pt/ru/uk configurations), plus one `color/iclauncher` entry (`#fffcfcfc` → `#ff0b0c1a`). The replay relocates the original unstyled string in the existing global string pool, preserving string indices and styled spans, and updates the color value. Parsed comparison of the patched table against the original confirms 69,954 unchanged entries, exactly eight changed payloads on two IDs, zero added/removed entries, and unchanged name/configuration/spec metadata. All eight changed entries match the exact released table's parsed records. The result is an intermediate branding-only table, not the final release table. Its SHA-256 is `b34ace1bfc5223147125d2c4bd75c993e61e5d5ab4aaf54f16bec312a1096513`.

The network configuration replay changes two user trust-anchor references to system and sets cleartextTrafficPermitted=false. The resulting binary XML matches the release's canonical structure but not its binary encoding. Its SHA-256 is `5f250c8ae0413e511b566de026433b170d3b1358dcfb7ce86ec155a560232981`.

Run from the audit directory, with the previously published `audit_resources.py`, `audit_resource_table.py` and `test_audit_resource_table.py` alongside these files:

```
python test_replay_branding.py
python replay_branding.py original.apk v4954.apk new_local_output
```

7/7 synthetic tests passed (pool replacement, missing/duplicate string, unsupported UTF16, preserving styles, refusing style-name replacement, invalid XML). Two CLI rejection checks passed (wrong APK hashes, existing output). Real replay passed and repeating the two transformations produced identical intermediate bytes. No Android runtime test, full table rebuild, icon reconstruction or APK assembly. Remaining table differences: 144 flag-only common entries, 687 added entries, package name and type-spec metadata. Other manifest, image, dependency provenance and class gaps remain open. Class coverage unchanged: 123/167 inherited and 97/113 own candidates.
