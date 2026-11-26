# CP584 v4954 — secure local storage source recovery

Scope: 11 first-party classes in classes8.dex. Both APK hashes were pinned and checked. A fresh disassembly of the exact release classes8.dex was compared to the prior private inventory and cached disassembly. Each recovered class is absent from all seven original DEX slots. Historical Java sources establish provenance, not exact Java compiler input parity. This subset implements local encrypted storage and does not acquire credentials, bypass authentication or change network requests. No APKs, signing material, secrets or third-party class bodies included.

## Historical source evidence

- `AndroidKeystoreCipherBox.java` SHA-256 `fcb2b7e0aaa8dc3271c16d0ea8650bff28f4791f5d982c19be451a4f7e6d6749`
- `AndroidTokenPreferences.java` SHA-256 `dcc090608face931fbddc354812bb2942f11ed3a7b7ecc79eb3e4a5946c7527c`
- `AndroidTokenStore.java` SHA-256 `f56a07b2f6cf5d3dc446d0f4faeadc86dec3cfef6fd542b62e1effbadb0c56d5`
- `CookieJarMigrationCore.java` SHA-256 `1f3142f27963024b34e97236d4b0cf7fe7431ad6cfc2e6503a03771da1717e66`
- `TokenMigrationCore.java` SHA-256 `0b0ed679a17d382ed1bb0b126938736660f61a42bc03d76d9159a5f902b3960d`
- `VKSecureCookieBridge.java` SHA-256 `f342bd01bc847a9a77a127ff6247d75dfd3d8b4757eb69dcba34068c33fce2d4`
- `VKSecureTokenBridge.java` SHA-256 `2e832241893e5038ff88325311b0dfaeee5e8b432898faabb9d05926e7139f6c`

## Verification

- 11/11 exact class hashes match fresh release disassembly and prior inventory.
- 11/11 exact Smali hashes after isolated assembly/disassembly.
- 7/7 historical Java source families recovered. The Java files are not published as exact release build inputs.
- 121 previously published inherited-class patch keys and 53 own class descriptors unique in local manifests; no overlap with this subset.
- String literals and field constants reviewed for embedded credential-like values and private identifiers. Names of storage fields, key aliases and encryption algorithms are not secrets. No direct Android Log or PrintStream output detected. This is a scoped static check, not a full security audit.
- Cumulative inventory coverage: 121/167 inherited-class entries and 64/113 new-class candidates.

No new APK, real Android Keystore run, runtime integration test or release tag. Isolated assembly does not prove that all referenced app methods are present in the public source subset. The existing APK remains unchanged.
