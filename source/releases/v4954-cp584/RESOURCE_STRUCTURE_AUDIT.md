# CP584 v4954 — local APK resource structure audit

Both input APKs are pinned by SHA-256 in `audit_resources.py`. This new audit independently compares uncompressed ZIP entries and conservative binary XML structure; it does not distribute original resources, binaries, XML values, credentials, or signing material.

| Scope | Result |
|---|---:|
| Changed ZIP entries | 2565 |
| Added ZIP entries | 61 |
| Removed ZIP entries | 2 |
| DEX/signature entries among differences | 13 |
| Changed res XML, equal parsed structure | 2509 |
| Changed res XML, different parsed structure | 41 |
| Changed res PNG | 7 |
| Added res XML | 18 |
| Added res PNG | 37 |
| Other | Manifest, resources.arsc, assets/index.html |

All three sets of changed/added/removed entry names exactly matched the earlier private inventory. The 2612 res differences include 2509 structural matches, 103 entries still needing provenance/content review. XML comparison resolves string-pool references and attribute resource IDs, preserves element/namespace/attribute order, typed values, raw strings and comments; it ignores line numbers, string-pool encoding/order and unused pool contents. The parser fails closed on unsupported chunks or styled pools. One XML with supplementary Unicode characters initially failed strict UTF-8 decoding; support for paired UTF-16 surrogates in the pool resolved that case. No unresolved XML parse failures remain in the changed pairs. This is not a complete Android binary XML validator, independent platform parser or proof of equal resource resolution: resource table semantics have not been compared. A structural difference may also reflect representation, not necessarily behavior.

## Reproduction

Run with Python 3 using locally obtained, authorized copies of the pinned original and v4954 APK:

```
python audit_resources.py original.apk v4954.apk private_inventory.json
python test_audit_resources.py
```

11/11 synthetic tests passed, including encoding, pool reorder, line numbers, supplementary characters, typed values, raw values, resource IDs, unknown chunks and malformed XML. The generated inventory contains paths and content hashes only; it is intended for local review. No full APK rebuild or Android tests occurred.

Next: resolve table resource IDs/configurations, inspect the 41 differing XML pairs, 7 changed images, 55 additions, manifest and added HTML; establish provenance/permissions and publish only authorized changes. Class coverage remains 123/167 unique inherited classes and 97/113 own-class candidates (220/280); this audit is not additional class coverage and not a claim of a complete source release.
