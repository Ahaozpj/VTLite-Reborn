# CP584 v4954 — accumulated media, privacy and package compatibility deltas

Scope: nine previously unpublished changes to inherited classes. This is a partial source recovery, not an independent APK build. The original and published APK SHA-256 values were checked before generating the manifest. The base is obtained separately; neither APK nor original class bodies are shipped here.

Reviewed changes:
- LoggingInterceptor delegate: remove the old HTTP logger's method body.
- BrowserUtils: use the actual local application package for browser filtering.
- NotificationBottomActionsAdapter: use the current context package for drawable lookup.
- BaseProfileFragment: Reborn-specific application URI and ACCESS_DATA permission namespace.
- VoipAppBindingFactory: use Reborn's incoming-call resource URI.
- WebViewFragment: remove the selected old log call.
- ImPhotoConverter: throw IOException when JPEG encoding returns false; retain cleanup.
- ThemesFragment: invoke the existing seedMissingThemeBooleans helper.
- StickersFragment: isolate the reload action under the Reborn package.

Historical provenance for the JPEG guard: VTLite_Reborn_encoder_guard_stage_report_2026-11-14.md and VTLite_Reborn_encoder_guard_integrated_report_2026-11-14.md. Package compatibility: VTLite_Reborn_package_compat_v1_audit_2026-11-14.json. These reports were consulted from the private project archive; no private links or original source files are included. Other entries were reviewed as narrowly scoped differences between the pinned original and release, not separately reconstructed from a complete commit history.

The manifest encodes references to lines of a locally obtained, disassembled base and only the reviewed new literal lines. It does not contain complete inherited class text. This is not a legal determination of redistribution rights.

## Replay

Use baksmali 3.0.10 to decode the exact original APK DEX files into directories `classes`, `classes2`, ... `classes7`. Then run:

```sh
python3 patches/replay_media_classes.py /path/to/original.apk /path/to/decoded /path/to/new_output
```

The destination must not exist. All base and target class hashes are verified before output creation. The output is a separate set of nine classes, not a complete DEX or APK. In particular the theme helper and other dependent changes are not supplied by this subset.

## Verified locally

- 9/9 exact SHA-256 matches after replay.
- 9/9 exact SHA-256 matches after isolated smali 3.0.10 assembly and baksmali 3.0.10 disassembly.
- 8/8 negative cases rejected before output creation: wrong APK, wrong target identity, wrong manifest count, duplicate class, unsafe class path, wrong base hash, invalid copy range, wrong target hash.
- 9 classes disjoint from the preceding 112 published replay entries. Current expected coverage: 121/167 inherited-class entries, 18/113 candidate new classes. Counts are inventory coverage, not complete build readiness.

No full APK assembly, Android runtime test, or new release tag was performed. The existing release is unchanged.
