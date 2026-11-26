# CP584 v4954 — dialog request route recovery

Five inherited-class deltas reviewed against the pinned original and released Smali. Historical CP354_REQUEST_ROUTE_REPORT.md and CP355_CALLBACK_ROUTE_REPORT.md support provenance of request attachment and callback routing; later release deltas reviewed directly. This is not an exact historical source compiler reconstruction.

- DialogsHistoryGetByCacheHelper: record fixed cache state categories; no new cache policy.
- DialogsHistoryGetByNetworkHelper and its response callback: pass the local view request token and existing IM origin to the conversation command, retain the original path when no view token exists; mark network lifecycle.
- DialogsListPresenter$c: capture screen epoch, discard stale callbacks and pending delivery on completion or exception, attach a request token once.
- LoadInitCmd: carry the request token into network args and request equality, record fixed stage categories; existing conditional initial page size change from 10 to 30 for the current main view.

The local view request token is a UI lifecycle object, not a login credential. Calls to RebornCaptchaHostQa, CP569PageUi and other adapters are retained from the release; the remaining adapters and callees need recovery and integration verification. No authentication policy or new network behavior is introduced. Fixed added literals reviewed; no account content is included in the patch package.

5/5 exact release-tree matches, 5/5 isolated assembly/disassembly matches and five manifest rejection checks. Twelve replay groups: 145 entries, 140 unique inherited classes, five identical overlaps. Eleven previous output directories reused and checked against hashes, not freshly assembled. 140/167 inherited, 97/113 new candidates (237/280). Remaining 27 inherited and 16 new candidates. No runtime test or complete APK rebuild. Only local-base replay operations and changed literals are distributed.

Run the replay script against the pinned original APK and decoded original tree, into a new replay_dialog_route_classes directory under the union root. Then run verify_replay_union.py with the latest index. The latest shared verifier and index supersede earlier versions.
