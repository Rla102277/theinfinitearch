# Sharpness pass and camera inventory: 21 Oct 2026

## Library on the Pro (read live)
81,301 items (79,530 stills, 1,771 videos); 10,998 hidden; 717 shared library; 2,427 in Recently Deleted.
Optimize Storage is on: originals local for under 1% (4 GB). Every photo has a ~480 px render
(`_4_5005_c`), about a third also a ~1,024 px render (`_1_105_c`). Earlier contact sheets used the 480 px
render, which is why soft frames passed.

Full camera table: `_IA_review/_work/cameras.tsv` on the Pro (make, model, frames, first/last month, hidden, shared, trashed).
- E-M10 Mark III 2,437 (1,633 hidden), E-M10 Mark II 673 (658 hidden). No Mark I in Photos.
- No Leica Q2 and no X-M5 in Photos. X-M1 82 frames. GFX 50R 31 frames, Mar to May 2018.
- Cabo (7 to 15 Mar 2020) was X-T2 (282) + iPhone XR + the charter's D7000. No Olympus anywhere, including
  hidden, deleted, and P309 to P312 filenames on any date. Closed.

## Sharpness gate on Maybe
3,206 unique Maybe frames scored (edge variance of the 4 sharpest tiles, on the best local render, compared within camera,
plus shutter vs 35mm focal length). 429 flagged, all looked at as full frame + 1:1 crop of the sharpest region.
- JUNK 30: removed from Maybe by `16_DropBlurry.applescript` (rebuilds 16 Maybe albums), keyword `Prov: Maybe` -> `QC: Blurry`.
- PULL 104: full-size JPEG export from iCloud via `15_PullFullRes.applescript` to `_IA_review/fullres/` for a 100% check.
- OK 295: metric false alarms (fog, haze, dusk, minimal sea, long-exposure water with crisp rock).
Verdicts: `sharp_verdicts.txt` (Q ids resolve through `questionable.json` on the Pro, which carries UUIDs).
