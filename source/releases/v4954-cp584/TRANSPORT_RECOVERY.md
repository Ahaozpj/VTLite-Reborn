# CP584 v4954 — transport provenance and OAuth response recovery

Four inherited deltas recovered from the pinned original/release Smali comparison. No original Java source claimed; intermediate source history incomplete.

- InternalOkHttpMethodCall records whether the three existing route override fields are null; it does not alter the route.
- InternalOkHttpExecutor clears previous observations and attaches provider/client provenance at existing response paths. CP566ProviderTrace and CP567ClientTrace (previously recovered) use weak identity references in thread-local scope for messages.getConversations. CP566 logs fixed category labels; CP567 does not log response contents. No additional network call or response contents exported by these two helpers. Runtime lifetime and concurrency not verified.
- InternalMethodChainCall passes the existing response and executor generation stamp into cp554ObserveRoute. This method remains a dependency and is not validated here.
- OAuthHttpUrlChainCall preserves existing CAPTCHA error flow but uses optional string access for captcha_sid and captcha_img, and passes redirect_uri as captcha_redirect_uri in the existing exception bundle. Downstream URL validation and actual manual verification remain outside this test.

4/4 exact release-tree matches, 4/4 isolated assembly/disassembly matches, five manifest rejection checks. Seventeen replay groups: 168 entries, 163 unique inherited classes, five identical overlaps. Sixteen prior output directories reused and hash checked, not newly assembled. Coverage: 163/167 inherited, 99/113 own candidates (262/280); four inherited and fourteen new candidates remain. Resources, dependencies and full application assembly outstanding. No APK or tag change, no Android runtime validation. Added literals reviewed; no raw credentials or full third-party class bodies included.

Run replay_transport_classes.py on pinned original APK and original decoded tree into a new group directory under the union root. Verify using latest union index.
