# CP584 v4954 — small first-party integration helpers

Five additional classes from the pinned released APK disassembly, matched to the private inventory and absent in all seven original DEX directories. Historical evidence documents the class families, not the exact compiler inputs.

- `classes2|Lcp136/AuthSummary;`: `CP136_REPORT.md` SHA-256 `b1e33b902f6a9c71821fdf2fd7c4339d3c4afdb6f44fa5157b6eca070cc7b7bc`.
- `classes2|Lcp140/AuthSummary;`: `CP140_REPORT.md` SHA-256 `273a3f1928c7b52eb47e70b8f50f7ef6dfde8f17aeb0e37937d1a52e957e68fa`.
- `classes3|Lcom/vk/im/ui/components/dialogs_list/vc_impl/CP332RetryClick;`: `CP332_INITIAL_DIALOG_ERROR_REAL_DEX_REPORT.md` SHA-256 `ec230cd871d04783258a1ca029dfed7db90452d78c5b677769cde3af6584620c`.
- `classes3|Lorg/vtlite/reborn/id64/DialogViewRequestToken$1;`: `DialogViewRequestToken.java` SHA-256 `0d19e40d1bcf767a9a40ca9a34b0f38f4b7b8cc3e72eb88b6ebc4f7cc16c0bcf`.
- `classes3|Lorg/vtlite/reborn/id64/DialogViewRequestToken$Slot;`: `DialogViewRequestToken.java` SHA-256 `0d19e40d1bcf767a9a40ca9a34b0f38f4b7b8cc3e72eb88b6ebc4f7cc16c0bcf`.

Verification: 5/5 matches with the pinned release inventory and 5/5 isolated assembly/disassembly matches. The previous 121 inherited-class entries and 92 own classes are unique across the local publication bundles. Fixed literals reviewed; no direct log output, embedded credentials or URLs in the five classes. AuthSummary wrappers forward the legacy caller string; this is NOT a proof of privacy across callers or the new opt-in diagnostic feature. The retry listener calls the host's existing retry path; the Slot revokes the previous request on replacement. No new APK, full build or real Android test.

Cumulative coverage: 121/167 inherited class entries and 97/113 own-class candidates. Remaining 46 inherited and 16 new candidates plus resources and dependencies.

Roundtrip note: the isolated Slot initially differed by a generated Baksmali accessor comment only. Including the previously published DialogViewRequestToken parent in the test DEX restored exact text equality for all five new classes. The parent is not counted or published again.
