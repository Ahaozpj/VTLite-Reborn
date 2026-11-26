# CP584 v4954 — API error and authentication diagnostics recovery

Six inherited deltas inspected against the original and released Smali. Historical provenance: CP498_REPORT.md (history denial classification), CP230_CAPTCHA_TRANSPORT_AND_SDK_PROTOCOL.md (captcha transport), CP140_REPORT.md and CP153_REPORT.md (auth observation). Recovered release deltas, not original Java compiler inputs.

- VKApiExecutionException and its companion: preserve a diagnostic category of a history access-denial subcode. Existing error code and denial remain; no permission override.
- VKErrorUtils: optional CAPTCHA fields and preservation of redirect URI for user-operated validation. This parser does not validate the URL; downstream validation remains necessary.
- VKAuthOkHttpExecutor: existing observation hooks for request shape, attempt count and response shape. Raw URL is passed internally to the shape adapter; no claim that full diagnostic pipeline is privacy-safe.
- BaseAuthPresenter: existing auth summary formatting hook; caller-supplied string requires privacy audit.
- EnterLoginPasswordFragment: existing trust-state dialog hook; no change to the server authentication decision.

6/6 exact release-tree matches, 6/6 isolated assembly/disassembly matches, five manifest rejection checks. Fourteen replay groups: 155 entries, 150 unique inherited classes, five identical overlaps. Thirteen prior output directories reused and hash checked, not newly assembled. 150/167 inherited, 99/113 own candidates (249/280); 17 inherited and 14 new candidates remain. Resources, dependencies and full application assembly still outstanding. No APK change, no Android runtime validation, no new auth fix. Added literal lines inspected for private data, no credentials included.

Run replay_error_auth_classes.py on pinned original APK and original decoded tree into a new group directory under the union root. Verify using latest union index.
