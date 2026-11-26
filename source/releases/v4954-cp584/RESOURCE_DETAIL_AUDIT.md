# CP584 v4954 — detailed resource audit

Both local input APKs were verified against the original and released SHA-256 values. The refined inventory agrees with the previous inventory for all 2612 changed or added `res/` paths and their hashes.

| Classification | Count |
|---|---:|
| Equal canonical binary XML | 2509 |
| XML differs only by deleted namespace declaration events | 40 |
| Other XML content difference | 1 |
| Existing PNG with different decoded RGBA pixels | 7 |
| Added XML, parsed successfully | 18 |
| Added PNG, decoded successfully | 37 |
| Total | 2612 |

Namespace-only compares all remaining events, including attributes, order, types, resource IDs, text and comments. It is not a claim that namespace removal is harmless on every Android parser. The seven changed launcher PNGs retain their dimensions, but decoded RGBA differs; this is not a color-managed visual comparison. Added resources have not been attributed to first-party or licensed dependencies and are not published here.

Manual review of the exact canonical manifest event differences identified version and compile-SDK metadata, package-specific permission/authority renaming, disabled application backup, and two additional non-exported CAPTCHA components. Target SDK was not changed in the observed event diff. The only remaining non-namespace XML difference in `res/` is the network security configuration; cleartext traffic is disabled and two trust-anchor entries change from user to system. No network traffic or runtime checks were performed. The added HTML is a 45-byte empty document skeleton; provenance remains to be established. The resource table has one package in both APKs (7,468,844 and 7,505,252 bytes respectively), and only the top-level chunk bounds/count were checked, not resource IDs, configurations or resolved values.

## Reproduction

Requires Python 3, Pillow, the previously published `audit_resources.py` in the same directory, and authorized local copies of the pinned APKs.

```
python test_audit_resource_details.py
python audit_resource_details.py original.apk v4954.apk private_detail.json
```

10/10 synthetic checks passed. The detailed local inventory contains paths, hashes, counts and dimensions, not raw resource contents. The manual manifest/network/HTML observations are not independently automated by this script. No original resources, dependency binaries, credential values or signing materials are included. No APK rebuild or Android test. Class coverage remains 123/167 and 97/113 (220/280). Next: resource table semantic audit, establish provenance for changed icons and 55 additions, and resume remaining class recovery. Do not count namespace-only cases as proven equivalent or claim a complete source snapshot.
