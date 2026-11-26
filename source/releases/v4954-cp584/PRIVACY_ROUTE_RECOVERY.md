# CP584 v4954 — privacy and request-route recovery

Five inherited-class transformations recovered from the pinned local original and release, and reviewed by normalized instruction diff. Only copy operations from the user's local original and changed literals are distributed, not complete original classes. Historical CP285 documentation supports ApiUtils redaction and CP354/355 documentation supports request identity; this is not proof of exact historical compiler inputs.

- ApiUtils: fixed API_ERROR_REDACTED instead of logging exception objects; special-case error 14 in the error message selection (not a challenge bypass).
- DefaultApiProfiler: fixed marker or numeric API code rather than request name and exception text in log/toast.
- AndroidBridge: deny legacy client-log retrieval and report unavailable; no new authorization capability.
- WebClients3: suppress three WebView logging calls.
- DialogsHistoryGetArgs: attach a request identity once; distinguish equality by that identity. No account or credential extraction.

5/5 exact text matches with the release comparison tree; 5/5 isolated assembly and disassembly matches; 5/5 manifest rejection tests; canonical index of nine replay groups verifies 133 outputs and 128 unique inherited classes (five identical overlaps). The eight previous replay directories were reused; their outputs are checked against the index, not rebuilt in this step. No runtime privacy guarantee: other sinks and caller data must be reviewed. No device test or APK build. Historical provenance of some log patches relies on comparison rather than original source recovery. Current candidate coverage: 128/167 inherited and 97/113 new, 225/280. Remaining 39 inherited, 16 new, dependency and resource gaps. Do not call this a complete source release.

Run the new replay script with the pinned original APK, its locally decoded tree and a new output directory. Place its results under replay_privacy_route_classes in the replay union root, and run verify_replay_union.py. The updated index supersedes prior copies and checksums for the two shared index files.
