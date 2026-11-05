# PageCue

A free, private reading prompter for authors. Paste your story, read it from the prompter while your camera records, tap to move to each next line, and export a wide or vertical video with your story on screen and your face in a corner bubble.

One HTML file. No install, no account, no uploads: your story and recordings never leave your device.

PageCue is a sibling to [PhraseCue](https://github.com/greenguy27/phrasecue), the lyric prompter for singers.

## Status

In development. Not released yet.

| Stage | What | State |
|---|---|---|
| 1 | UI direction (Studio) | Done |
| 2 | Story import + prompter + tap timing | Done (0.1.0) |
| 3 | Camera + mic recording | Done (0.2.0) |
| 4 | Review + timeline fixes | Done (0.3.0) |
| 5 | Wide + vertical video export, captions, recording recovery | Done (0.4.0) |
| 6 | Retake mode: stumble key, cut markers, edited export | Done (0.5.0) |
| 7 | Export screen, Clip Creator, presets, reader cues | Done (0.6.0) |
| 8 | Look and branding: background images, opening and ending cards | Done (0.7.0) |

## Run it on your computer

Browsers only allow the camera and microphone on a secure address, and a file opened straight from a folder (`file://`) often doesn't count. PageCue includes a tiny launcher that serves it at **http://localhost:8765**, which does. It only listens on your own computer and needs no install.

| Computer | Double-click | Notes |
|---|---|---|
| Windows | `Start-PageCue.bat` | Uses the PowerShell that comes with Windows. If SmartScreen asks, choose *More info → Run anyway*. |
| Mac | `Start-PageCue.command` | Uses Python 3 (run `xcode-select --install` once if it's missing). The first time, right-click → *Open*. |
| Anything else | `python3 -m http.server 8765 --bind 127.0.0.1` in the PageCue folder | Then open http://localhost:8765 |

Keep the launcher window open while you use PageCue; close it to stop.

## Retakes

Stumbled on a line? Press **R** (or the Retake button) while recording. PageCue jumps back to the start of that line, counts down 3-2-1, and you read it again. The camera never stops: the failed attempt is marked as a cut and left out of the exported video and captions.

- Press R again during the countdown to start over without adding a second cut
- Change the key on the Record screen
- In Review, every cut is listed; play it, or restore it if you'd rather keep that part
- Cuts are saved while you record, so they survive a crash along with the take

## Reader cues

Put directions for yourself in square brackets: `[Pause 2 seconds]`, `[Whisper]`, `[Look at camera]`. They show on the prompter as notes and are never put on the video or in the captions. Give a cue its own line to make it its own prompter line. If your story uses brackets as story text (text messages, game screens), turn cues off on the Story screen.

## Clips

On the Export screen, choose **A clip**, pick the first and last line, and export just that part: retake cuts are still removed, and the captions match the clip. Name and save clips to export them again later. Presets remember your usual export settings.

## Background and cards

On the Export screen, **Background** puts an image behind your story text (with darkening, blur and per-format positioning), and **Opening card** and **Ending card** add a title card and a closing card, such as your book cover and where to find the book. Images stay on your device and are saved inside the project file. Vertical videos keep everything inside the area that TikTok, Reels and Shorts don't cover.

## Support

PageCue is free. If it helps you, you can [buy me a coffee](https://buymeacoffee.com/cer5061k).

## License

MIT. See [LICENSE](LICENSE). The name PageCue and its branding are not covered by the license.

---

By greenguy27 · [CRBooks.ink](https://crbooks.ink)
