# Changelog

## 0.3.0 — in testing

Stage 4: review and timeline.

- New Review step (unlocks once you have a take)
- Your take plays inside the face bubble with the story text on top, exactly as it will export; wide or vertical
- Timeline of every timed line: click a line to jump to it, click empty space to seek, drag a line's left edge to move its start
- Nudge the selected line 0.1 s with `,` and `.` (Shift for 1 s); Space plays or pauses; ← → move between lines
- Lines can't overlap or shrink below 0.15 s
- Timing edits are saved with the take, so they survive a reload; "Reset timing to the take" restores your original taps
- Video settings: story text as one line at a time, or the current line plus the one before; face bubble top left, top right or bottom; circle or rounded square. The record preview follows the same settings
- Short takes stretch to fill the timeline; long takes scroll and follow the playhead
- Warns when the take ended before the last lines, or when the lines changed after recording
- Local launchers (`Start-PageCue.bat` for Windows, `Start-PageCue.command` for Mac) serve PageCue at http://localhost:8765 so the camera and mic work without uploading anything
- When PageCue is opened straight from its folder, the Record screen explains how to start it with the launcher instead

## 0.2.0 — in testing

Stage 3: camera and recording.

- Turn on camera and mic from the Record screen; pick the camera and microphone; live mic level
- Your camera appears in the face bubble of the "Viewers see" preview (mirrored there only; the recording is not mirrored)
- Record with a 3-2-1 countdown (Esc cancels); every tap is logged against the recording's clock
- Stop recording to get a take: play it back, download the video (MP4 where the browser supports it, otherwise WebM), or retake
- The last take is kept in the browser, so a reload doesn't lose it; if the browser can't store it, PageCue says so and warns before you close the tab
- Warns when the prompter lines change after a take, since its timing may no longer match
- Project file (.pagecue.json): save and open your story, lines and take timing (the video stays a separate file)
- Screen stays awake while recording, where the browser allows it
- Loading a file that's already one line per row switches to Line break, so your own line breaks are kept
- Support link (Buy Me a Coffee) and credits on the Story screen
- Phone mode: front camera, vertical framing, and a nudge on takes longer than 15 minutes

## 0.1.0 — 2026-11-04

First build: stage 2 of the plan (story + prompter).

- Paste a story, or load or drop a `.txt` / `.md` file; title and author fields
- Split into lines by sentence (abbreviations like "Mr." kept together) or by line break
- Markdown **bold** and *italics* kept, even when a split falls inside them
- Editable line list: one prompter line per row
- Prompter with the current line near the top (close to the webcam), the previous line faded above, three upcoming below
- Next: Space, →, ↓, PageDown, Enter, or click the prompter (presentation clickers work); Back: ←, ↑, PageUp, Backspace
- Practice run logs a timestamp per tap; Back drops that line's tap; Esc stops
- "Viewers see" preview, wide 16:9 or vertical 9:16, showing the current and previous line
- Laptop / Phone device mode
- Text size A− / A+
- Story, lines and settings saved in the browser
- No network requests: system serif fonts instead of web fonts
