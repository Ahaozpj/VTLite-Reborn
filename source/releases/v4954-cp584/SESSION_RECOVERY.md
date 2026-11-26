# CP584 v4954 — session lifecycle and error handling recovery

Six inherited deltas recovered against the pinned original and released Smali, not original Java compiler inputs. Historical evidence includes CP365_NO_RETRY_QA_REPORT.md (local parser error rethrow) and VTLite_Reborn_HTML_HTTP_STATUS_CHECKPOINT_2026-11-14.md (photo HTML error classification). Later session changes identified by actual release diff; no claim all intermediate source revisions were found.

- ImEnvironmentImpl and VKApiManager forward the existing IM credential update with the owner ID to the executor.
- OkHttpExecutor retains existing validation, replaces the generation stamp upon credential update, checks stamp/owner/nonempty credentials, and classifies HTML photo responses without logging their body. CP567ClientTrace is called with request/response/client objects; its runtime confidentiality needs review.
- InternalErrorRetryChainCall rethrows the existing local parser exception on the specific diagnostic prefix; no global retry change, no additional network call or server permission change.
- VKApplication and VKAccountManager invoke existing lifecycle callbacks around app readiness and account mutations, including login/logout. No new credential extraction. Callback bodies remain dependencies, not validated by isolated assembly. Some mutations lack a matching afterMutation on the inspected path; this is faithful recovery, not a repair.

6/6 exact release-tree matches, 6/6 isolated assembly/disassembly matches, five manifest rejection checks. Sixteen replay groups: 164 entries, 159 unique inherited classes, five identical overlaps. Fifteen prior output directories reused and hash checked, not newly assembled. 159/167 inherited, 99/113 own candidates (258/280); 8 inherited and 14 new candidates remain. Resources, dependencies and full application assembly outstanding. No APK change, no Android runtime validation. Added literals inspected; no raw credential values or third-party class bodies included. The lifecycle callback implementation and privacy must be separately checked.

Run replay_session_classes.py on pinned original APK and original decoded tree into a new group directory under the union root. Verify using latest union index.
