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

---

## Structure as built (14 Oct 2026, evening)

| Folder | Albums | Photos | Status |
|---|---|---|---|
| `TRIPS` | 60 | 23,145 | all frames per place, any date |
| `WORKING` | 60 | 17,800 | no significant face; the second-look cut |
| `TRIP MEMORIES` | 58 | 4,631 | complete; frames with a face >=6% of frame |

Built additively. `TRIPS` was never rebuilt, only extended.

### The GPS oracle (Randy's idea, and it worked)

For each day, use iPhone frames that carry GPS as a **location oracle** to place the
no-GPS camera frames from the same day. This inverts the earlier GPS trap: GPS is used
only to decide WHERE, never to decide what is valuable.

Placed **6,989** previously unplaceable frames. Japan +1,155, Iceland +914, New Orleans
+500, Kentucky +401, Quebec +373.

Per-place matching radius = 75th-percentile spread of that album's own GPS points, capped
at 260mi, with explicit overrides for large places (Japan 600, Oregon 600, Alaska 400,
Iceland 400) and a **blacklist** so the 14 albums verified as false or thin can never
attract new frames.

### Memories vs Working

Split on **detected face size**, not face presence: `ZDETECTEDFACE.ZSIZE >= 0.06`. A
landscape with one distant figure stays in Working. A portrait goes to Memories.

## TWO ASSET CLASSES PHOTOS WILL NOT PUT IN AN ALBUM

Both fail **silently**: AppleScript reports `ADD OK` and nothing lands. One bad member
kills an entire batch of 90, so a few hundred poison pills can zero out a whole album
(Japan came back 0 of 2,814 on the first run).

**1. `ZCLOUDISMYASSET = 0` — 686 stills that are not Randy's.** Shared into his library by
four other iCloud users. Japan 354, Quebec 135, Iceland 93, New Orleans 51, Kentucky 51.
All iPhone. **These must be excluded from grading: he did not take them.**

**2. `ZVISIBILITYSTATE <> 0` — 3,317 stills.** Appears to be iCloud Shared Library
membership (inferred from `ZCLOUDLOCALSTATE=0`, `ZSAVEDASSETTYPE=4`, and owner hashes;
not confirmed). **973 of these are Randy's own real-camera frames**, including
**147 GFX100S II**, 229 X-Pro3, 115 X-T2, 100 a6000, 96 X-E5, 19 X-T5, 11 GFX100RF.
1,170 of the 3,317 are from 2026, the Japan and Iceland year.

These 973 cannot enter any album until they are moved back to the Personal Library in the
Photos UI. They are not lost, they are fenced off.

**Rule for every future pass: filter `ZVISIBILITYSTATE = 0 AND (ZCLOUDISMYASSET IS NULL OR
ZCLOUDISMYASSET = 1)` before generating any album script.**

Residual after both repairs: 1,196 frames still outside WORKING (1,160 visibility, 36 burst
stack). That is 6% of the Working layer.

## FINALS (planned 14 Oct, evening; not yet imported)

The locked portfolio lives in a Lightroom catalog, not a folder:
`~/Documents/Projects/Infinite ARch Photo Workspace Local/Final Prints and IMages/Final Prints and IMages.lrcat`

It references 415 files across sibling show/series folders under `~/Documents/Projects/Photography/`:
VAGF, The Gallery, TPS, ThePlatform, TheBeacon, Seascapes, Chasing The Sun, The View, plus an
auto-import dump. Collapsed by title stem: **137 photographs, 115 titled**. 39 have a negative in
the catalog; 17 of those negatives are already in Photos. 58 carry a print size in the filename.
Lightroom star ratings are meaningless (Randy's word) and must not be mapped to Tier.

Plan: new top-level `FINALS` folder, one album per show/series (a title shown in four shows is in
four albums). One high-res JPG per photograph into Photos; TIFs, backing cards and sized outputs
stay on disk. Keywords: `Final: <title>`, `Source: <negative filename>`, `Catalog: <lrcat>`,
`Printed: <sizes>`. `Tier:` left empty. Lightroom and Photos do not roundtrip; the keyword link on
filename is the only durable bridge, and Randy's `lrc_gen.py` already speaks to the catalog.
