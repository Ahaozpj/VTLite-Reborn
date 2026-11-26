# CP584 v4954 — manual CAPTCHA UI adapter source recovery

Scope: 28 first-party Smali classes in classes10.dex. Both APK SHA-256 values were pinned and checked. Fresh disassembly was compared to the prior inventory and cached release disassembly; every class is absent from all seven base DEX slots. The historical Java sources establish the adapter families' provenance, not identical compiler inputs. The adapters invoke the official user-operated CAPTCHA UI, handle the result, cancellation and timeout, and do not automatically solve challenges. The fixed-category QA event definitions are included as part of the context adapter. No APK, SDK binaries, signing material or credential values are included.

## Historical evidence

- `CaptchaWorkerAwaiter.java` SHA-256 `f55283fdde1593c6a852b744e2dbfb4043b6a192cee2f4a509744a01eff74de5` — 2 release classes.
- `RebornCaptchaBridge.java` SHA-256 `2117301169609c731b16f4452d1380863eed193919c92acce3bc75fb5c7f0dd6` — 9 release classes.
- `RebornCaptchaContextBridge.java` SHA-256 `012f896a95a0c905b814ee11ac8799862c2ca2230defa502dd6c68fc7e9c6227` — 17 release classes.
- `RebornCaptchaHostQa.java` SHA-256 `9f43bb603f0310158a1a54b1b89c7a14a3e452aa3d4e1f89b822582bace33a25` — corroborates the historical enum-only QA event interface (host adapter itself not included here).

## Verification

- 28/28 exact matches to fresh disassembly and inventory.
- 28/28 exact hashes after isolated Smali assembly and disassembly.
- Prior 121 inherited-class patch keys and 64 own descriptors unique in local manifests; no overlap with this subset.
- Reviewed string constants and direct SDK invocations. No direct network, WebView, preference storage, raw log output or embedded credential values detected in this subset. This scoped static review is not a full security or runtime audit.
- Cumulative inventory coverage: 121/167 inherited-class entries, 92/113 candidate own classes.

The legacy integration entrypoint, account lifecycle integration, host diagnostic adapter and remaining dependencies are outside this subset. Successful isolated DEX assembly does not imply that the complete application builds or that live CAPTCHA works. No new APK or release tag, no live Android tests. The released APK remains unchanged.
