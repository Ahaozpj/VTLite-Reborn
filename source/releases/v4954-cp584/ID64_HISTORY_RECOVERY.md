# CP584 v4954 — historical model, index and preview class recovery

Seven additional first-party Smali classes recovered from the exact released APK, with historical project records as provenance evidence. The original and release APK SHA-256 values were verified, and each class was matched to the private inventory. The historical records are not a claim that the exact original build input has been recovered. No third-party class bodies or binaries are included.

## Historical references

- `CP484HistoryResult` — `CP484_REPORT.md` SHA-256 `a285fc30ba2976966087c39ed65561e06cef30b24255711c8abfb63cf564d14c`
- `CP500HistoryRow` — `CP500_REPORT.md` SHA-256 `5a2a9f2627489d7c13f9a554ceb34856f73cbb8a83c287faedab94a82e48e846`
- `CP518ImOrigin` — `CP518_REPORT.md` SHA-256 `0475b378342f689c01a34204b7e81f7d02bce9395d29a3bd46abd87bccd45b80`
- `CP519HistoryObservation` — `CP519_REPORT.md` SHA-256 `c8ec3d2320db3c2c1225c870134b90e6fa32101977975010816184fdfeaf5538`
- `CP522DialogIndex` — `CP522_REPORT.md` SHA-256 `9b6781ef49035cc2262250299a3d2777648bc7a82f02cc0d8232380cf3e808fc`
- `WideDialogPreviewView` — `WideDialogPreviewView.smali` SHA-256 `0c2025c9068db0002936dc038cc49c8c59ec107ac6e63737db4537959a2341f4`
- `WidePreviewLiveAccount` — `WidePreviewLiveAccount.smali` SHA-256 `936b0d9e6af1a05126f4f584d86844220e4477aab2eb9904a751270d648c5f76`

## Verification

- 7/7 exact release class and private inventory matches.
- 7/7 exact Smali matches after isolated assembly and disassembly.
- Prior 121 inherited-class entries and 46 own classes are individually unique; none of the seven duplicates an earlier own-class file.
- Fixed string literals checked for credential-like values, raw URLs and email addresses. These classes include model and diagnostic logic; successful isolated assembly does not establish that all referenced methods are available in the partial public tree.
- Cumulative coverage: 121/167 inherited-class inventory and 53/113 new-class candidates.

No new APK, Android runtime test, complete build or release tag. Existing release unchanged. This subset does not establish functioning live history access.
