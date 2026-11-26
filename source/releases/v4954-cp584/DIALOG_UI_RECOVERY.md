# CP584 v4954 — dialog request and UI integration recovery

Three inherited deltas recovered against the pinned original and released Smali. Historical evidence: CP332_INITIAL_DIALOG_ERROR_REAL_DEX_REPORT.md (initial error and retry), CP354_REQUEST_ROUTE_REPORT.md (request binding), CP518_REPORT.md (native IM origin checks). Recovered release deltas, not original Java compiler inputs.

- MessagesGetConversationsApiCmd: binds a request to its origin and current session observation before attaching the parser context; ordinary SDK call remains. No new network request or permission override.
- DialogsListPresenter: request generation, error recovery, invalidation, deferred retry and delivery to current view.
- DialogsListVc: mount/clear lifecycle and local preview, error/retry UI, previous gated preview helpers. Restored code requires other recovered and still-pending components; no claim of Android lifecycle correctness from static assembly.

3/3 exact release-tree matches, 3/3 isolated assembly/disassembly matches, five manifest rejection checks. Fifteen replay groups: 158 entries, 153 unique inherited classes, five identical overlaps. Fourteen prior output directories reused and hash checked, not newly assembled. 153/167 inherited, 99/113 own candidates (252/280); 14 inherited and 14 new candidates remain. Resources, dependencies and full application assembly outstanding. No APK change, no Android runtime validation. Added string literals inspected; cp360Log accepts a caller string, so no general confidentiality guarantee.

Run replay_dialog_ui_classes.py on pinned original APK and original decoded tree into a new group directory under the union root. Verify using latest union index.
