# CP584 — cumulative UI and settings replay (partial source recovery)

Scope: public v4954-cp584, original and release APK SHA-256 are pinned in `patches/ui_replay_manifest.json`. This is a further subset of the cumulative Reborn modifications, not a new APK or a complete source release.

## Recovered changes

- Four TaskLoadMore/TaskInvalidateHistory classes: reset loading state on errors for cache/network tasks.
- Five deferred DialogsListVc callbacks: capture a generation ticket and ignore obsolete callbacks.
- DialogsListPresenter$b: generation check and fixed diagnostic markers on successful load.
- AboutHook and VTSettings: actual installed APK version and package-specific sticker-count broadcast action.

Only line references to locally obtained original classes and the reviewed literal delta instructions are shipped. No complete inherited classes, APKs, signing material or logs are included. The replay needs exact baksmali 3.0.10 output of the original APK, organized in classes2 through classes7 directories (DEX slots). Run from the snapshot root:

```sh
python3 patches/replay_ui_classes.py /path/to/original.apk /path/to/decoded /path/to/new-output
```

## Validation

- Original and released APK SHA-256 matched their pinned values.
- Exact text replay and comparison to the release: 12/12.
- Smali 3.0.10 isolated assembly and baksmali 3.0.10 roundtrip: 12/12 exact matches.
- Negative tests rejected: 8/8 (wrong APK, wrong source, wrong manifest scope, duplicate class, invalid path, invalid copy, target mismatch, existing output).
- No duplicate target hashes relative to the 100 previously reviewed inherited classes.

Scope limitations: isolated assembly checks syntax/encoding, not Android ART or functional behavior. Still needs the other classes, resources, third-party dependency provenance and full build. Cumulative coverage of inherited inventory is 112/167, new class candidates 18/113. These are counts, not an overall completion percentage. Do not change v4954 tag or APK. Full GitHub ZIP/TAR.GZ pending.
