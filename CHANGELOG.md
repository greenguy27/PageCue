# Changelog

## 0.5.0 — 2026-11-04

Stage 6: retake mode.

- Press the retake key (R by default, changeable on the Record screen) or the Retake button when you stumble; the prompter goes back to the start of that line and counts down 3-2-1 before you read it again
- Recording never stops: the failed attempt becomes a cut marker, and the line's timing restarts after the countdown
- Retake the same line as many times as you need; pressing the key again during a countdown restarts the countdown without adding another cut
- Review lists every cut with its line and length; play a cut, restore it to keep that part, or cut it again. "Reset timing to the take" also brings back the original cuts
- Cuts show on the timeline, and the preview skips them during playback
- Export and captions leave out every active cut; the exported length is the take minus the cuts
- Audio and picture stay in sync across cuts: export switches between two players that are already waiting at the next section, so nothing pauses or seeks mid-recording
- Cuts are saved while you record; after a crash, recovered takes keep their cuts, and a retake that was still counting down becomes a cut to the end of the take

**New look**
- Warmer Studio design: a compact one-line header with the logo, icon tabs, a project menu (edit title and author, save or open a project file), and redesigned Story and Prompter Setup cards
- Footer with an About PageCue box and the support link
- Optional desk scene on the Story screen (books, mug, plants); drop your own images into `assets/`, or PageCue draws placeholders

## 0.4.0 — 2026-11-04

Stage 5: export and captions, plus recording recovery.

**Export**
- Export the take as a wide 16:9 (1920×1080) and/or vertical 9:16 (1080×1920) video, with the story text and face bubble exactly as previewed
- Optional 3-second title card with the title and author
- MP4 with H.264/AAC where the browser supports it; the download button shows the codec used
- Runs in real time with a progress bar and Cancel; keep PageCue in front while it exports
- The Export step is now active (it opens the export settings)

**Captions**
- Download captions as SRT or VTT, built from your script and timing (no speech recognition; names are always spelled right)
- Fix a caption's text per line in Review, or mark a line as not spoken so it's left off the video and the captions
- Captions shift automatically when the title card is on

**Recording recovery**
- Every second of a take, and every tap, is saved in the browser while you record
- If the browser crashes, the computer freezes, or the tab closes mid-take, PageCue offers to recover the take next time it opens; recovered takes play back and export normally
- Takes are recorded as WebM where possible, because Chrome's MP4 recorder holds the whole take in memory until Stop and can't be saved as it goes; if a browser can only record that way, PageCue says crash protection is off instead of pretending
- Shows how many minutes of crash-protected recording the browser has room for; if storage fills up mid-take, it warns you, keeps recording, and the take still finishes

**Fixes**
- Timing and caption edits no longer rewrite the whole video in storage, and the last edit is kept even on a quick reload
- The Windows launcher no longer freezes when the browser opens a spare connection

## 0.3.0 — 2026-11-04

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

## 0.2.0 — 2026-11-04

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
