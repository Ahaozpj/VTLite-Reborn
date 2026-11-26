# CP584 v4954 — history diagnostics recovery

Four inherited class deltas reviewed against original and release. Historical CP511_REPORT.md supports native history outcome instrumentation; audit_actual_parser_path.py and cp327_safe_audit.py document the original ID parser path. These are release deltas, not a claim of exact original authoring sources.

- DialogsHistoryGetCmd: fixed source markers for existing network, actual and cache branches.
- UserApiParser: records rejected ID shape before the original integer validation; original rejection remains. This is not an ID64 fix by itself.
- DialogsRefreshReporter: stage begin/return/exception observation, rethrow original exception. The stage string is supplied by the caller and the diagnostic adapter needs separate privacy verification.
- MessagesGetHistoryApiCmd: passes existing peer context to the parser and records fixed outcome and denial-category diagnostics, preserving the existing code-15 fallback. No new access, permission bypass or retry behavior.

Added literal lines reviewed; no credential or private account values distributed. Several diagnostic adapters still need recovery. No runtime privacy or behavior assurance from isolated assembly. 4/4 exact release-tree matches, 4/4 isolated assembly/disassembly matches and five manifest rejection checks. Thirteen replay groups: 149 entries, 144 unique inherited classes, five identical overlaps. Twelve previous output directories reused and hash checked, not freshly assembled. 144/167 inherited and 97/113 new candidates (241/280); 23 inherited and 16 new candidates remain, plus resources and dependencies. No APK rebuilt or modified.

Run replay_history_diag_classes.py on pinned original APK and original decoded tree into a new group directory under the union root. Run verify_replay_union.py with the latest index. Latest shared verifier and index supersede earlier versions.
