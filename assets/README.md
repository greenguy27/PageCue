# Optional desk images

The Story screen shows a small desk scene: books on the left, a coffee mug on the right, and a plant at each edge. PageCue draws simple placeholders for these. To use your own artwork instead, put PNG files with transparent backgrounds here, using these exact names:

| File | What | Shown about |
|---|---|---|
| `scene-books.png` | Stacked books, sitting on the desk | 230 px wide |
| `scene-mug.png` | Coffee mug, sitting on the desk | 140 px wide |
| `scene-plant-left.png` | Plant leaves coming in from the left edge | 120 px wide |
| `scene-plant-right.png` | Plant leaves coming in from the right edge | 120 px wide |

Make each image about twice the width shown, so it stays sharp on high-resolution screens. Any file that's missing falls back to its placeholder. The images load from this folder only, never from the internet, and they're hidden on small screens and in Phone mode.
