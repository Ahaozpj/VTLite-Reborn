# CP584 v4954 — preferences, media and history parser recovery

Four inherited-class transformations reviewed by normalized instruction diff against the exact original and release. The historical theme_store_patch.py and November 15 V2_FILE1_CODE_DIAGNOSTIC checkpoint support the first-party provenance of the theme migration and numeric upload-error handling; CP519 history observation was previously recovered. This is not proof of exact historical compiler inputs.

- Preferences: prefer existing default-store values, retain legacy fallback, seed missing AMOLED/Monet/Milkshake values without overriding existing settings, handle selected type errors; developer menu uses stored value. No new settings access mechanism.
- ImageUploadParser: parse files.file1 upload response, report numeric error_code, pass successful response to existing model. The complete downstream upload path is not tested here.
- MessagesGetHistoryApiCmd$a: retain caller peer context for existing CP519 observation and preserve native parser path even if observation throws RuntimeException or LinkageError. No new request, permission or session behavior.
- H2 (FileManager): omit explicit default static field initializers (null/false); no independent behavioral improvement claimed.

4/4 exact release-tree matches and 4/4 isolated assembly/disassembly matches; five manifest rejection checks. Ten replay groups verify 137 results and 132 unique inherited classes, five identical overlaps. Nine previous output directories reused and checked against their hashes, not freshly assembled. 132/167 inherited and 97/113 new candidates, 229/280 total. No Android runtime, full build or privacy guarantee. Remaining 35 inherited and 16 new candidates plus resource/dependency gaps.

Run the replay script on the pinned original APK and local decoded original tree, output to a new replay_preferences_media_classes directory under the replay union root, then run verify_replay_union.py. The latest shared index and verifier supersede previous versions. Only local-base copy operations and changed literals are distributed, not full inherited class bodies.
