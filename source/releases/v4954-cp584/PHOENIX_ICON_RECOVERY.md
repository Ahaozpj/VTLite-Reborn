# CP584 — Phoenix artwork recovery

Recovered the historical first-party 1254×1254 PNG. SHA-256 `a6ed9d91ab71dfbc60ce8df2514de6c67cba4dd0ee6126b3c50e2847eefb6842` matches the November 15 icon checkpoint. The archived `vtlite_reborn_icon_build.py` documents the seven icon transformations; its signing and packaging code is not distributed. The present standalone script generates five densities, a round icon and an adaptive foreground. The original artwork is preserved losslessly in numbered base64 text parts (UTF-8 repository transport); `decode_artwork.py` validates and restores the PNG. Only the Reborn artwork is included, not original VTLite resources or any signing data.

7/7 decoded RGBA buffers and dimensions match the exact SHA-256-pinned release. For the round icon, compositing onto a transparent canvas clears RGB under fully transparent pixels; the historical mask alone differs in 3142 such pixels. One encoded PNG is byte-identical; six differ in PNG encoding. This is not a claim of bit-reproducible APK assembly. Python Pillow 12.3.0 was used. Seven synthetic unit tests passed, and two independent renders were byte-identical. No Android runtime or APK build. Class counts remain 123/167 and 97/113. Added dependency resources and remaining class gaps are not included.

## Reproduce

From `artwork/` run `python decode_artwork.py Phoenix.png`. From `audit/` run `python test_replay_icons.py` and `python replay_icons.py ../artwork/Phoenix.png new_output --release /path/to/v4954.apk`. The release argument is optional and used solely to validate locally generated artwork.
