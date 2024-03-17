# Muxing new audio into mkv
### Mux audio from secondary file into original
- get all streams from original file: `-map 0`
- get only audio from secondary file: `-map 1:a`
- `-c` used to set codecs, copy will just copy without re-encoding
- `-avoid_negative_ts 1 -max_interleave_delta 0` to fix issues with mkv
- set labels for new audio `-metadata:s:a:1 language=eng -metadata:s:a:1 title="English"`

```
ffmpeg -i original.mkv -i secondary.mp4 -map 0 -map 1:a -c:0 copy -c:1 eac3 -avoid_negative_ts 1 -max_interleave_delta 0 -metadata:s:a:1 language=eng -metadata:s:a:1 title="English" muxed_original.mkv
```