# CP584 v4954 — ID64 scope and read-only projection recovery

Partial recovery of nine first-party classes, not a complete APK build. The original and release APK SHA-256 values were verified. Exact release Smali was matched to the private inventory. Historical source files support the provenance of each class, but are not claimed to be the exact release build inputs. No vendor class bodies or APKs are included.

## Historical references

- `ReadOnlyDialogDelivery.java`: `1f8f0729f9ccd4a8986879845698d682d0f6c8afa7431314d746c68288363f07`
- `ReadOnlyDialogPreview.java`: `9110316cd2b56697db4341c18698e122c05e059d2e70bcbb354ca792b4daa7fa`
- `ResponseEntryGuard.java`: `23c8bf223f8332383bb68f59fb18c88be5ef638a537f9f7fc48513730e7b5ad4`
- `WideDialogListProjection.smali`: `be43a3e2f62cc93921a62ef17d0950d45c14173e5e1389cd1505dbe3cd335f66`
- `WideDialogReadOnlyLane.smali`: `64bf463b063b946d27b764ee32c3e249f625b986e7aefe11ecfb2ef672ad1e2a`
- `WideDispatchSessionTicket.smali`: `ee19a7591ce4c7302fb0096dd660dfdac792a9077d35a6f41cff05237b952fae`
- `WidePreviewEpochGate.smali`: `86409f0efdc6ef3177120b41d40590c4bcca35bead550d4993428d20118173ab`
- `WideProfileCatalog.smali`: `7a024f854491896d5869d6ab4aafab832298e31cb58a5b3c54a5cc5c6eb0ed0a`
- `WideReferenceSnapshot.smali`: `0dd622fc4d719f0a20a7946de5bd19b58cee7aa779d0101aff26a81326897ba0`

## Verification

- 9/9 match the exact release disassembly and private inventory.
- 9/9 exact Smali matches after isolated assembly and disassembly with smali/baksmali 3.0.10.
- 121 preceding inherited-class entries and 37 preceding own-class files are disjoint within their respective groups. None of the nine duplicates those own classes.
- Reviewed fixed string literals contain no raw URLs, credential values or user data. Session ticket checks compare current account identity and generation; they do not extract credentials or change authorization.
- Cumulative coverage: 121/167 inherited classes and 46/113 new-class candidates. External class references and dependencies are not yet a complete build closure.

No device test, full APK build, or new tag. APK and previous publications unchanged.
