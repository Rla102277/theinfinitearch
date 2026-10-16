# Library Structure Audit — 14 Oct 2026

Audit of the Apple Photos library after the TRIPS-by-location rebuild. Read this before any further grading pass. The operational rules and the by-eye album verification live in `../curation/`; this is the quantitative pass that preceded them.

**Revision note:** an earlier version reported 52% coverage and 16,214 missing frames. That was wrong. It computed each album's date span from all its frames, including strays, which inflated single trips into multi-year spans. Randy corrected the premise (Alaska once, Quebec and Montreal once; other places repeatedly), which made it possible to separate real visits from strays. Corrected figures below.

**Later caveat (curation/CLAUDE.md):** the album names themselves proved unreliable on by-eye verification, and GPS correlates with iPhone snapshots rather than camera work. Treat the per-location table below as a first pass, not a plan.

## Library baseline

- 67,636 photos (stills only; 80,826 including video and other asset kinds)
- 16,840 carry GPS (24%). 50,796 have none.
- TRIPS structure: 60 location albums, 18,038 frames carrying `Loc:` keywords

## Method

A date block is a run of consecutive shooting days with gaps of 2 days or less. A block of 10 or more frames is a real visit. A block under 10 frames is a stray.

Across 60 albums: 116 real visits, and 242 stray blocks holding 665 frames (3.7% of the structure).

The gap counts frames inside real visit windows that carry no `Loc:` keyword, excluding frames whose GPS puts them more than 75 miles from the trip's centroid.

## Corrected headline

70% coverage. 16,659 frames in, 6,938 missing. Not one of the 60 locations is complete.

## Problem 1 — Iceland, 841 frames missing including 245 GFX

| | |
|---|---|
| In structure | 312 |
| Missing in the same window | 841 |
| Coverage | 27% |
| Missing by camera | iPhone 16 Pro Max ×252, GFX100S II ×245 |

One visit, 2026-01-12 to 16, GPS-confirmed. The 245 missing GFX frames are the most deliberate files in the library. One date window, no ambiguity.

## Problem 2 — Nine albums contain no real visit at all

| Album | Stray frames held | Real trip, from the away-cluster sweep |
|---|---|---|
| Nashville | 7 in 5 blocks | 2018-12-23, ~315 frames, E-M10 Mark III |
| Scottsdale | 11 in 3 blocks | 2014-10-24, ~337 frames, NEX-5T |
| Boston | 13 in 7 blocks | 2015-10, ~252 frames, ILCE-6000 |
| Little Rock | 25 in 9 blocks | ~203 frames, iPhone 15 Pro |
| Marble Falls | 21 in 6 blocks | 2016-10 |
| Arizona | 11 in 7 blocks | — |
| New Braunfels and Austin | 13 in 2 blocks | — |
| San Diego | 9 in 2 blocks | — |
| Sedona | 3 in 1 block | 2019-07 E-M10, 2022-03 X-Pro3, ~74 frames |

## Problem 3 — Remaining gaps by location (40+ frames missing)

| Location | Visits | In | Missing | Coverage | Top missing cameras |
|---|---|---|---|---|---|
| Atlanta | 1 | 10 | 112 | 8% | X-E2 ×107 |
| Destin | 2 | 28 | 166 | 14% | X-T5 ×162 |
| Louisville and Seattle | 2 | 21 | 105 | 16% | ILCE-6000 ×85 |
| South Padre Island | 1 | 44 | 184 | 19% | DSC-WX9 ×94 |
| Paris Texas | 2 | 26 | 107 | 19% | iPhone 15 Pro ×38 |
| Orlando | 3 | 36 | 117 | 23% | ILCE-6000 ×94 |
| Riviera Maya | 2 | 81 | 228 | 26% | E-510 ×209 |
| Iceland | 1 | 312 | 841 | 27% | GFX100S II ×245 |
| New Braunfels | 5 | 93 | 194 | 32% | X-Pro3 ×87 |
| Seattle | 2 | 78 | 125 | 38% | PowerShot SD880 ×74 |
| Galveston | 3 | 70 | 113 | 38% | NEX-5N ×76 |
| College Station | 4 | 136 | 207 | 39% | iPhone 15 Pro ×75 |
| Florida Keys | 1 | 109 | 164 | 39% | Canon EOS Rebel T6 ×123 |
| Georgia | 7 | 381 | 520 | 42% | ILCE-6000 ×417 |
| Disneyland | 1 | 143 | 163 | 46% | DSC-WX9 ×162 |
| Arkansas | 3 | 52 | 60 | 46% | X100VI ×21 |
| Punta Cana | 3 | 237 | 234 | 50% | X-Pro3 ×97 |
| Kentucky | 3 | 391 | 382 | 50% | iPhone 16 Pro Max ×227 |
| Heber Springs | 5 | 274 | 241 | 53% | X-T5 ×92 |
| Durango | 2 | 145 | 123 | 54% | X-E2 ×66 |
| Cabo | 1 | 236 | 142 | 62% | X-T2 ×118 |
| Maine | 3 | 123 | 49 | 71% | X-T5 ×22 |
| New Orleans | 10 | 1,380 | 520 | 72% | NEX-5N ×151, E-510 ×112 |
| Puerto Vallarta | 2 | 256 | 81 | 75% | X100V ×35 |
| Guadalupe Mountains | 5 | 437 | 134 | 76% | X-T5 ×61 |
| Oregon | 2 | 267 | 67 | 79% | X-Pro3 ×65 |
| Austin and Galveston | 2 | 256 | 59 | 81% | ILCE-6000 ×47 |
| Montreal and Quebec City | 1 | 648 | 149 | 81% | iPhone 16 ×80 |
| Disney World | 5 | 1,506 | 315 | 82% | NEX-5N ×142 |
| Arizona and New Mexico | 1 | 624 | 110 | 85% | ILCE-6000 ×100 |
| New York | 4 | 940 | 140 | 87% | ILCE-6000 ×76 |
| Washington DC | 3 | 786 | 111 | 87% | E-510 ×62 |
| Colorado | 5 | 1,579 | 213 | 88% | Canon ZV-223 ×71 |
| Alaska | 1 | 495 | 45 | 91% | X-Pro3 ×32 |
| Japan | 1 | 1,962 | 115 | 94% | iPhone 15 Pro ×32 |

## Problem 4 — 52 unidentified away-from-home clusters

Day-clusters with GPS more than 150 miles from home, 12+ frames, 8+ from one camera, in no `Loc:` keyword: 52 clusters, 4,503 frames. Largest:

| Dates | Frames | Place from GPS | Camera |
|---|---|---|---|
| 2026-01-12 → 16 | 899 | Iceland | iPhone 16 Pro Max |
| 2011-06-14 → 20 | 564 | Anaheim CA | DSC-WX9 |
| 2025-10-11 → 13 | 371 | Quebec City | iPhone 16 Pro Max |
| 2013-06-18 → 22 | 354 | New Orleans | NEX-5N |
| 2015-07-19 → 23 | 230 | Harlingen / S. Padre | DSC-WX9 |
| 2009-08-01 → 06 | 164 | New Orleans | E-510 |
| 2009-04-23 → 25 | 137 | Riviera Maya | E-510 |
| 2015-06-30 → 07-04 | 108 | Petrified Forest AZ | ILCE-6000 |

New Orleans appears seven times (2009-08, 2013-06, 2018-10, 2019-10, 2021-10, 2021-11, 2022-10, 2023-10). The Feb-2015 cemetery day was the one instance that got noticed.

`2021-11-02` is 59 frames from a QSS-32_33 film scanner at New Orleans coordinates: scanned film from a NOLA trip, never folded in. Film gets different treatment under the rubric.

## Repair order

Additive only. Nothing is deleted from an album. Photos stays the system of record and every step is reversible.

1. Iceland. One window, GPS-confirmed, 841 frames, 245 GFX.
2. The nine zero-visit albums, built from their actual windows.
3. The single-visit trips: Japan, Alaska, Punta Cana, Cabo, Riviera Maya, Disneyland, South Padre Island, Florida Keys, Oregon, Montreal and Quebec City.
4. The repeat destinations, per visit, using the 116 known visit windows.
5. The 665 stray frames.

Grading should wait until steps 1 through 3 are done.

## Open items carried forward

- Feb-2015 cemetery day (72 frames, no GPS): needs `Trip: 2015-02 New Orleans`, `Loc: New Orleans`, album membership
- 3 cemetery frames misfiled under San Antonio
- 69 of 18,108 frames failed to add to TRIPS albums (hidden-burst-frame batch-drop bug); keyword layer caught 18,038
- `IA:` grades and `Ch:` chapters not yet written for the 57 NOLA pulls plus ~18 cemetery pulls
- Family Snapshots album (295 face-detected frames) not yet built
- Legacy junk keywords pending cleanup: `landscao` (686), `landscape` (2,649), `core_keep` (31,574), `has people` / `has no people` (~98,000)
- 34 of 66 NOLA contact sheets unread
