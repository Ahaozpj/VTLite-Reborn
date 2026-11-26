# v4954 cumulative source audit — 26 November 2026

**Partial publication, not the full source tree.** Original APK and VK/VTLite classes, binaries, resources and signing material are excluded.

- Original VTLite APK SHA-256: `2c312fecefce700bae0a956227f79474a6e17da64e93f22f0cb98d4e0436bb30`.
- Released Reborn v4954 SHA-256: `5f6f67d33141e398e97f951f68a83fa35d1c02bedf99a2e31f2bb714b521a3a8`.
- Baksmali 3.0.10, all 7 base DEX and all 10 target DEX disassembled. Key = DEX slot + class descriptor (duplicates across DEX slots preserved). Base 40,270, target 41,512; exact-text unchanged 31,268; 9,002 changed, 1,242 added. Ignoring blank lines, comments and selected debug directives, 167 changed classes remain; 8,835 filtered changes are not claimed as functional differences. APK payload entries: 2,565 changed, 61 added, 2 removed (signature entries included). Resource semantic comparison and third-party provenance are pending.
- The seven additional ID64 classes below are absent from the original in the corresponding DEX slot and present in the actual v4954 DEX. Their normalized Smali matches archived Reborn checkpoint sources (not just a namespace guess); published content is the exact v4954 disassembly. Fixed diagnostic labels reviewed; no private keys, credentials or logs included. This is not a complete security audit or a build test.
- 1,001 relocated Kotlin classes are not included. Other new classes, changes inside inherited classes and resource changes are pending provenance and safety review.

| File | DEX | Archived source evidence | SHA-256 |
|---|---|---|---|
| `CP531TransportObserver.smali` | `classes2.dex` | `CP565_VTLite_Response_Identity_SOURCE_ONLY.zip` | `187f4cd2c720df2d70ac093601f91750a872e434015a0650c9a267ec8303b21c` |
| `CP536ListMount.smali` | `classes3.dex` | `CP556_VTLite_Native_Consumer_Lifetime_SOURCE_ONLY.zip` | `4d655d08a901d78f557defc44f4631eeda5b742f83739d19ae58d9da6e12531c` |
| `CP549Ingress.smali` | `classes3.dex` | `CP549Ingress.smali` | `4bcdefda2532d1fc4133debffc35639675296f4f4b5e5e8120da8f81798cc45e` |
| `CP551Cache.smali` | `classes2.dex` | `CP551_VTLite_Cache_Diagnostic_SOURCE_ONLY.zip` | `f44a3232e1c81f7e3a8a6ab5aeb470c6c7e62d473371d4290e97af4afc62feb8` |
| `CP566ProviderTrace.smali` | `classes2.dex` | `CP567_VTLite_Concrete_Client_SOURCE_ONLY.zip` | `5502826fb1e20d91e02d2a73829a23266abcc16be499cd8c73d01917588564ba` |
| `CP567ClientTrace.smali` | `classes2.dex` | `CP567_VTLite_Concrete_Client_SOURCE_ONLY.zip` | `2aca482a92df53a23845fe2cf961a557905ba9422fc4039bc93da10660aced46` |
| `DialogPreviewScope.smali` | `classes3.dex` | `CP556_VTLite_Native_Consumer_Lifetime_SOURCE_ONLY.zip` | `5a75334ccfd63070bd4560fa071eeca032bd4f662d505e201d0dd70a69d5e23a` |

The original public release tag is unchanged; standard ZIP/TAR.GZ at that tag do not contain this supplement. Do not treat this partial source publication as a complete independently buildable release.
