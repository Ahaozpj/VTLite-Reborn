# CP584 v4954 — local dialog preview recovery

Two first-party classes recovered from the pinned release's previously decoded classes3 tree: DialogPreviewView and DialogPreviewScope$Screen. Both match the private candidate inventory byte for byte and are absent from all original DEX slots. The release and original APK hashes were rechecked. Historical provenance: CP497_REPORT.md describes the local exact-key detail UI, CP437_REPORT.md and src__patch_view.py describe earlier preview changes. The Screen interface is also referenced in the previously recovered DialogPreviewScope. This is recovered Smali, not a claim to have the original Java compiler inputs.

The click route checks the main thread, attached views and current bound scope, consumes the chosen row, retains the exact typed key for local detail, and preserves the explicit refresh action. No new history request from this row action; the view states that this is not chat history. Screen declares paint and requestRemoval. The old probe remains a referenced dependency. Fixed log labels were inspected; no runtime confidentiality guarantee. No third-party bodies or credentials are included.

Checks: 2/2 exact inventory/release-tree matches, 2/2 exact isolated Smali assembly/disassembly matches, original absence 2/2; previous 144 inherited output hashes and 97 own-class hashes rechecked against the release tree/inventory. No fresh full DEX disassembly or full application build, no Android runtime. Cumulative coverage 144/167 inherited, 99/113 own candidates, 243/280 total. 23 inherited and 14 new candidates remain, plus resources and dependencies. APK and tag unchanged.

Historical evidence SHA-256:
- CP497_REPORT.md: `a1129b93b86dce339f50d00696abb4b6cec8fbce0da5d29282148d56d9dcdeff`
- CP437_REPORT.md: `48a135858857dd06126b7f50a31e309538d047c82cc93f9001d67010ab2a3627`
- src__patch_view.py: `be1cf6f23a03a9ed819b3abb27f9ab2d8975c5d0a1365bbcb959479aa4a9b72e`
