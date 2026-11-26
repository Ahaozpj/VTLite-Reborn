# CP584 v4954 — resource table structural and typed-value audit

The original and release APKs were SHA-256 pinned; both resource tables parsed with the new local Python analyzer. The supported format is the observed single-package dense table with 64-byte configurations, non-compact entries, string pools including styled spans, and simple or bag values. Unknown formats fail closed. No resource content, APK, dependency binary or signing material is published.

| Metric | Original | Release |
|---|---:|---:|
| Named resource IDs | 20831 | 20887 |
| ID/configuration entries | 69962 | 70649 |
| Type/configuration pairs | 220 | 220 |

The 20831 common IDs retain the same type/key names and package ID; 56 IDs are added, none removed or renamed. All 220 type/configuration pairs match at the raw configuration level. Of common entries, 69810 match including entry flags, typed values and ordered bag contents, 144 differ only in entry flags, and 8 differ in payload (possibly also flags). There are 687 added entries, all on new IDs, and none removed. 152 changed entries span 38 IDs: 151 string entries and one color entry. Additions by type: 604 string, 49 drawable, 12 id, 10 color, 5 attr, 4 layout, 2 anim and 1 style. Package name changed; package ID and compared package metadata are equal. Twenty type-spec headers differ in the 16-bit field following the flags byte; compare this separately from individual spec flags. Exactly 36 common spec slots differ in their flags, with 56 added slots and no removed slots. These metadata differences are not treated as harmless or as proof of equivalent runtime behavior.

## Verification

Use Python 3 and the previously published audit_resources.py in the same directory, with authorized local copies of the pinned APKs:

```
python test_audit_resource_table.py
python audit_resource_table.py original.apk v4954.apk private_table_inventory.json
```

13/13 synthetic tests passed: encoding, pool reorder, changed string value, type, entry flags, separate spec header and flag changes, config change, styled span, bag, invalid string index, unknown chunk, truncated table. The local inventory records only IDs, raw configuration bytes, difference categories and hashes of compared entry records. This is a scoped parser, not a full Android validator or runtime resource resolver; references are compared as typed IDs, not recursively resolved, and the parser does not reconstruct tables. Matching values do not prove equivalent resource lookup, XML behavior, or identical metadata. There is no independent platform parser or new Android test. The class coverage remains 123/167 inherited and 97/113 candidate classes. Attribution and publication rights for resource additions and changed content remain pending; no full APK rebuild or source archive is claimed.
