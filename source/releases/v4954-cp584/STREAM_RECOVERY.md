# CP584 v4954 — stream and fallback recovery

Three unique inherited-class patches recovered against the original APK and exact release. No original APK, DEX or complete inherited class body is distributed. The replay copies existing lines from the user's local original and applies the reviewed changes. The exact release APK hash was checked. The historical reports document provenance, not exact compiler inputs.

- FilePartRequestBody: repeated skip to offset, bounded reads and EOF/zero-read rejection.
- FileFullRequestBody: content URI handling, read to EOF, zero-read rejection and byte-count check against a known length.
- FallbackUploadHelper: do not fall back on interruption or local I/O failures; bounded traversal of causes. Generic EOF is not independently a local failure.

## Historical evidence
- `VTLite_Reborn_upload_consistency_review_2026-11-14.md` SHA-256 `76b22e866a2d935c96df46870685ca5d4538b578f2ad6cde2b82d37eed8d026f`
- `VTLite_Reborn_EOF_PROVENANCE_report_2026-11-14.md` SHA-256 `a6316d04683f7b4bd90b10e54076e7c51c57f8c80ab2f2e4bf3155d8dc75f85c`
- `VTLite_Reborn_ZERO_READ_GUARD_CHECKPOINT_2026-11-14.md` SHA-256 `7bac9cb71a18d6176ebdc9efa8e02fbd87f0bc7456bdf35323c4ef600e8d11ff`
- `VTLite_fallback_independent_audit_2026-11-14.md` SHA-256 `b103a72affa7e66107485d0f33931d7c517bf94347b3f14332de30a0299e4126`

## Verification

- 3/3 exact replay and independent comparison to release disassembly.
- 3/3 exact isolated Smali/Baksmali roundtrip, grouped by DEX slot.
- 5/5 negative replay tests rejected, with no output directory: wrong manifest base, wrong target hash, duplicate, invalid range and path.
- The updated union checker verified 128 output entries from eight patcher output directories, 123 unique classes, 5 identical overlapping entries. Seven previously generated output directories were reused, not freshly rebuilt in this step.
- Cumulative: 123/167 unique inherited entries, 97/113 own-class candidates (unchanged). 220/280 total; 44 inherited and 16 own candidates remain, plus resources and dependencies.

## Limits

This is source recovery, not a new media fix. The historical audit identified possible overrun-before-length-check, invalid range and exception cleanup concerns; this step does not resolve or runtime-test those issues. No APK rebuilt or signed, no device tests. The old release and tag remain unchanged. Prior audit checksums describe the earlier index revision; the present checksum list supersedes only the two updated union files.
