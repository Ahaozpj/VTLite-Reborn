# CP584 v4954 — manifest replay

First-party local transformation of the exact SHA-256-pinned original APK manifest. The released APK is optional and used only to verify canonical event equality. No original manifest, dependency binaries, signing materials or APKs are distributed.

The new script modifies 32 existing attributes: package/version/build metadata, application backup flag and package-scoped permission/authority names. It adds two non-exported CAPTCHA components as observed in v4954. The application class namespace is intentionally preserved. All 1882 canonical XML events match the pinned released manifest; encoded bytes differ. The original contains 1878 events. Existing counts: 77 activities, 81 aliases, 39 services, 30 receivers, 7 providers, 69 uses-permission declarations and 7 permission declarations. The release adds one activity and one provider, with other counts unchanged. Target SDK and existing exported flags are preserved by the transformation. This is structural verification, not a platform security or installation test.

The reconstructed manifest SHA-256 is `24913f508079e3636379bcf9564bb27271e0aa19c489151bdc679d728e9a31eb`. Two independent invocations generated identical bytes. Nine unit tests pass, including canonical serialization, separate resource IDs, namespace renaming, backup flag, inserted components, wrong APK, incorrect metadata and application nesting. A CLI invocation with existing output is rejected. The serializer uses an unstyled UTF-16 string pool and retains canonical typed values, raw values, attributes, comments and element order; it does not preserve original line numbers or binary pool layout. No independent Android parser or runtime verification.

Dependency check: both added components are in release classes9.dex; the added activity's theme ID 2131952775 exists in the release table but not the original. The manifest must not be used on the unmodified original APK as a complete build. Dependencies and resource attribution remain unresolved. Class coverage unchanged at 123/167 inherited and 97/113 own-class candidates.

## Reproduce

Use Python 3 and the already published `audit_resources.py` in the same directory, with an authorized local copy of the pinned original APK.

```
python test_replay_manifest.py
python replay_manifest.py original.apk new_manifest.xml --release v4954.apk
```

Omit `--release` to generate the intermediate manifest from the original alone. Output must not already exist. No APK, previous release or tag is modified.
