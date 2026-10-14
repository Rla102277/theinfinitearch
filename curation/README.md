# Apple Photos Library Curation — The Infinite Arch

Working archive of the Apple Photos restructure and audit. Captured 14 Oct 2026.

**Photos is the system of record.** Everything here reads `Photos.sqlite` read-only and writes back through AppleScript. Nothing here is a parallel catalog.

## Library baseline

- 67,636 photos (stills; ~80,826 including video and other asset kinds), roughly 1.16 TB
- 16,840 carry GPS (**24%**). 50,796 have none.
- Structure after the restructure: 2 top-level items (`TRIPS`, `OLD Do not delete`), 60 location albums, 18,038 frames carrying `Loc:` keywords

## The headline finding

**The album names are unreliable.** The TRIPS structure was built from the names of pre-existing albums, and those names were never validated against the pictures inside them. Verified by eye:

| Album | What is actually in it |
|---|---|
| **Wyoming** | January 2016 **New Orleans**. Jackson Square, St. Louis Cathedral, a Krewe du Vieux float. Zero Wyoming frames. |
| **Nashville** | A Six Flags Holiday in the Park stage show in Arlington, a bluebonnet portrait, two selfies, a Puerto Vallarta street. Zero Nashville frames. |
| **Scottsdale** | 2 real frames (saguaro, desert hillside, GPS 33.58/-111.68). The other 11 are a trunk-or-treat and a department store holiday event, all shot at home. |
| **Boston** | 3 real frames (conference podium, the Cheers sign at GPS 42.35/-71.04). The rest is home, Dallas, and four nearly black a6000 exposures. |
| **Arizona** | 3 Washington DC frames (38.90/-77.03), 3 Disney World frames (28.36/-81.59), one probable Arizona road, a whiteboard, a bird, a muddy Jeep in Denton County. |

15 albums fail a GPS sanity check against their own name. Several have median GPS sitting on the house in Frisco: Boston, Pennsylvania, Galveston, Quanah, College Station, Orlando.

**Method note:** GPS was the only signal that never lied. Album names lied. Date spans lied. Inference from frame counts and camera models lied. Any future pass should anchor on GPS first and use contact sheets for the 76% that has none.

## What else was found

- **Iceland**: 312 frames in the structure, ~1,300 shot. 245 missing frames are **GFX100S II**, the highest-value files in the library.
- **New Orleans appears 7 times** in the away-from-home sweep (2009-08, 2013-06, 2018-10, 2019-10, 2021-10, 2021-11, 2022-10, 2023-10) outside the NOLA album.
- **2021-11-02**: 59 frames from a **QSS-32_33 film scanner** at New Orleans coordinates. Scanned film, never folded into the structure.
- **2015-02-28**: 72 frames with no GPS, no "New Orleans" moment, outside every derived date window. This is the **cemetery day**, holding two of the strongest New Orleans frames. 47 were sitting in `City and Street (sure)` classified as architecture but never identified as New Orleans. 3 were misfiled under San Antonio.
- **52 away-from-home day-clusters** (4,503 frames) sit in no location album at all. Largest: 2026-01-12→16 Iceland (899), 2011-06-14→20 Anaheim (564), 2025-10-11→13 Quebec (371), 2013-06-18→22 New Orleans (354).
- **356 legacy ratings** were preserved as keywords before album deletion. They were the only pre-2026 selects layer in the library and would otherwise have been destroyed.

## Layout

```
curation/
  scripts/applescript/   the five scripts run against Photos (01-03 and 05 ran and verified; 04 superseded)
  scripts/python/        contact sheet builders and analysis passes
  data/                  JSON outputs from every analysis pass
  evidence/              contact sheets proving the album misnaming
```

### AppleScripts

| Script | Status | What it did |
|---|---|---|
| `01_PreserveLegacyTags` | run, verified | Saved 356/357 legacy ratings as `Legacy:` keywords before anything was deleted |
| `02_RemoveEmptyAlbums` | run, verified | Deleted 55 confirmed-empty albums |
| `03_FillKeywordGaps` | run, verified 4,655/4,655 | Wrote `Kind:`, `Known Best:` and `Trip:` keywords |
| `04_RemoveRedundantAlbums` | **built, never run, superseded** | Replaced by moving folders to OLD rather than deleting |
| `05_BuildTripsByLocation` | run, verified | Built the TRIPS folder, 60 location albums, 18,039 memberships, `Loc:` keywords on 18,038 frames |

### Key data files

| File | Contents |
|---|---|
| `visit_blocks.json` | 116 real visits vs 242 stray blocks, per location. The useful primitive. |
| `name_check.json` | The 15 albums whose GPS contradicts their name |
| `missed_trips.json` | 52 away-from-home clusters with GPS, distance and camera |
| `final_plan.json` | The 11,418-membership sweep plan **(do not run: built on the unverified album names)** |
| `trip_gaps.json` | Per-location coverage gaps **(superseded, inflated by contaminated date spans)** |
| `wyoming.json` | The 14 frames that broke the whole approach |

## Hard-won operational rules

- Add photos to albums in **batches of 90**. 100 or more triggers an "Apply" dialog per batch.
- Photos **drops the entire batch** if one photo in it is a hidden burst frame. Retry in smaller slices and verify counts after.
- AppleScript **cannot move albums between folders**. Create and delete only.
- Smart albums **cannot be created** by script.
- Photos uses **different internal IDs on each Mac**. UUID lists do not transfer between machines.
- `Photos.sqlite` is ~2.96 GB. Do not copy it. Open read-only in place:
  ```python
  sqlite3.connect("file:" + urllib.parse.quote(path) + "?mode=ro", uri=True)
  ```
- Core Data epoch offset to unix: `+978307200`
- Derivatives: `resources/derivatives/masters/<X>/<UUID>_4_5005_c.jpeg` and `resources/derivatives/<X>/<UUID>_1_105_c.jpeg`
- Search index `search/leo.sqlite` has `items` and `lexicon`; `lexeme_ids` is a packed little-endian uint32 array. Lexeme **3164** is the Grave/Tomb/Headstone cluster, which is how the cemetery frames were first located.

## Known open items

- 69 of 18,108 frames failed to add to TRIPS albums (0.4%, the burst-frame batch-drop bug). The keyword layer caught 18,038, so the data is intact.
- Feb-2015 cemetery day not yet added to the structure; 3 frames still misfiled under San Antonio.
- `IA:` grades and `Ch:` chapters not yet written for the 57 NOLA pulls plus ~18 cemetery pulls.
- Family Snapshots album (295 face-detected frames) not yet built.
- Legacy junk keywords pending cleanup: `landscao` typo (686), `landscape` (2,649), `core_keep` (31,574), `has people` / `has no people` (~98,000).
- 34 of 66 NOLA contact sheets unread.
- Contact sheets for NOLA, Feb 2015 and the gap passes (~68 MB) were left out of this repo. Regenerate with `scripts/python/build.py` and `f15.py`.
