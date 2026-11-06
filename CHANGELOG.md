# Changelog

## 0.7.6 — 2026-11-05

Export sync and long-take testing. Recording, retakes, review, clips and the look work exactly as before.

- Exporting wide and vertical together: the second video no longer starts with a brief picture stutter. PageCue now frees each finished export's memory right away and pauses a moment before starting the next format
- Tested a 10-minute take: the exported video keeps picture and sound together from start to finish, with no drift building up over time
- Fixed: while recording, the "Stop recording" button showed white text on a white background (since 0.7.5). It's red with white text again
- Known limit: export records in real time, so if the computer gets busy during an export (other apps, a full disk, an update in the background), the picture can freeze for a moment, usually a frame or two, before catching up. Exporting again on a quieter computer gives a cleaner file

## 0.7.5 — 2026-11-05

Design pass: one consistent look across every screen. Nothing about recording, retakes, review, clips or export works differently.

- Record: Camera and mic, Take and Retake key are matching cards with icon headings; Play take, Retake and Download have icons; the bottom bar has clearer Back, Next and Retake buttons
- Review: Video settings is a card with an icon heading; the timeline, selected line, retake cuts and caption row are restyled; leaf decorations sit at the edges on wide screens
- Export: Captions and File details are their own sections, like Background and the cards; the summary rows have icons
- File details shows an estimated size per format before exporting (clearly marked as an estimate) and the real sizes afterward
- The "Local-first & private" footer, with About PageCue and Support, is on every screen, and steps aside while you're recording
- Contrast: every text color meets WCAG AA on its background (cue lines on the timeline were darkened to pass)
- Phone: format choices stack, and the record bar's buttons no longer wrap

## 0.7.0 — 2026-11-04

Stage 8: look and branding.

**Background**
- Put an image behind the story text: book cover art, a scene, anything you have the rights to use
- One image for both formats, plus an optional separate image for vertical video
- Position each format on its own: left–right, up–down and zoom, or drag the preview
- Darken (so the text stays readable) and optional blur; a plain color is still available
- The Record screen's live preview shows the background too

**Opening and ending cards**
- Opening card: title, author, subtitle and an optional cover image, 2–5 seconds (replaces the 3-second title card)
- Ending card: a headline, a second line or website, and an optional cover image, 3–8 seconds
- Optional 0.4-second fades on the cards only; the reading itself starts and ends on time, so captions don't move
- Cards work on clips too, and "Play the card" shows them with their fades

**Exact preview**
- Review and Export draw their preview with the same code as the export, so what you see is what you get

**Vertical safe area**
- Vertical videos keep the face bubble, story text, title line and cards out of the edges that TikTok, Reels and Shorts cover with buttons and captions
- The title line moved from the bottom of vertical videos to just under the face bubble
- An optional guide shades the covered area in the preview (never exported)

**Set up the look before recording**
- The Export step opens before you've recorded anything, so you can choose the background and cards first; the preview shows a sample frame from your story, and exporting unlocks once you have a take
- The Record screen has a "Background and cards…" link, and its preview shows the background

**Launchers**
- The Mac and Windows launchers only reuse a running PageCue if it's this folder's copy; if another copy holds the port, they say so instead of opening the wrong version
- The Mac launcher shows which folder it's serving and stops the browser from showing an old cached page

**Images and project files**
- Images stay on your device. Large images are shrunk locally (backgrounds to 1920 px on the short side, covers to 1600 px); your original files aren't changed
- Images over 40 MB or 50 megapixels are refused with a clear message
- Project files now carry the background and card images, so a project opened on another computer keeps its look; older project files still open
- Presets save the background and cards too

## 0.6.0 — 2026-11-04

Stage 7: Export screen, Clip Creator, presets and reader cues.

**Reader cues**
- Text in [brackets] is a note for the reader, like [Pause 2 seconds], [Whisper] or [Look at camera]: shown on the prompter, never on the video or in captions
- A cue on its own line becomes its own prompter line (tap past it like any line); a cue inside a line is shown on the prompter and left out of the video text and captions
- During a cue-only line, the video keeps showing the last spoken line, and that caption stays up
- Timing, retakes and crash recovery work exactly as before
- A switch on the Story screen turns cues off for stories that use brackets as story text; it's saved with the project

**Export screen**
- Export has its own step: preview, what to export, formats (one or both), title card, captions, a summary, and one Export button with progress and Cancel
- Review keeps how the video looks (story text, face bubble) and gains Continue to Export
- The summary shows the length after cuts and the file type this browser will really make

**Clip Creator**
- Export a range of lines as a clip, with an optional lead-in and tail (0.3 s by default)
- Retake cuts inside the clip are still removed; the clip's captions start at 0:00 and match it exactly
- Save named clips with the take and re-export them any time; clip files are named after the clip

**Presets**
- Built in: Wide video, Vertical short, Both formats
- Save your own: formats, title card, story text and bubble look, clip lead-in and tail; kept in this browser only

**Export check**
- After each file is made, PageCue reopens it and confirms it plays, is the right size and length, and has picture and sound; if not, it says so next to the download

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
