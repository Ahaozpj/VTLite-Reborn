# CP584 v4954 — message and media upload recovery

Three inherited-class deltas reviewed against the exact pinned original and release Smali. Historical provenance supported by CP122_REPORT.md, CP188_REPORT.md, CP202_VERIFY_REAL_APK.py and VTLite_Reborn_TEXT_SEND_ERROR_PROBE_CHECKPOINT_2026-11-14.md. This is not an exact historical source compiler reconstruction.

- MsgSendJob: skip an already completed message in the failure path; distinguish text and media failures, use bounded cause traversal and error categories.
- GenericUploader: stage and duration classification, malformed-response shape and numeric-code diagnostics. Legacy prefix-based exception suffix display is not a proven redaction boundary; future privacy audit needed.
- ImageUploader: existing upload_v2 protocol integration and bounded transient retry logic, including interruption checks and fresh upload-server retrieval. No new retry behavior is introduced here.

3/3 exact release-tree matches, 3/3 isolated assembly/disassembly matches and five manifest rejection checks. Eleven replay groups: 140 entries, 135 unique inherited classes, five identical overlaps. Ten previous output directories reused and checked against hashes, not freshly assembled. 135/167 inherited, 97/113 new candidates (232/280). Remaining 32 inherited and 16 new candidates. No runtime test, complete APK rebuild or privacy guarantee. Only local-base replay operations and changed literals are distributed.

Run the replay script against the pinned original APK and decoded original tree, into a new replay_message_media_classes directory under the union root. Then run verify_replay_union.py with the latest index. The latest shared verifier and index supersede earlier versions.
