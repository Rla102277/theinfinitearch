# HANDOFF: THE INFINITE ARCH Photos restructure + curation

Written 15 Oct 2026, 4:51pm CT, for whoever picks this up next (Codex or a new Claude).
Read this, then `CLAUDE.md`, then `curation/verdicts/v3-summary.md`.

## Who and what

Randy Archambault, fine art photographer, brand THE INFINITE ARCH. Director of Data & Integration by
day; he catches bad numbers and wants to be challenged, not flattered. **No em dashes, ever.** ALL CAPS
is emphasis, not anger. Direct, first person, verdict first.

Goal: make his 78k-photo Apple Photos library navigable (by place, by people vs no people), then
curate by chapter toward fewer, stronger images.

Locked chapters: **1 Thresholds, 2 Companions, 3 Witnesses, 4 Elsewhere, 5 Becoming, 6 Keeping**
(Keeping is provisional). Do not rename or invent chapters. The governing docs (Unified Protocol v1.1,
Master KB, Curatorial Decision Log) live in the claude.ai Project "THE INFINITE ARCH — MASTER". Grading
tiers S / A+ / A / A- / B+ / B / C, eleven-dimension critique, classifications Anchor / Support /
Developmental / Personal Archive / Exclude.

## Machines

| | MacBook **Pro** (main) | MacBook **Air** (worker) |
|---|---|---|
| Role | Randy's daily machine. Do NOT run Photos jobs here. | All Photos write jobs run here. |
| Photos | same iCloud library | same iCloud library; albums AND keywords sync both ways (verified) |
| Helper | `~/Pictures/_IA_review/runner/runner.sh` disabled (exit 0) | `runner/START.command` in a Terminal window. launchd agent is installed but does NOT fire (TCC blocks it); the Terminal loop works |
| Work dir | `~/cullwork/nola/` (older scripts, v3 json) | `~/work/` (v3place.py, v3final.py, v3final.json, todo.json, thresh_*.json) |

Internal Photos UUIDs differ per Mac. Always regenerate UUID lists from the machine that will run the job.
On the Air the join columns are `Z_1KEYWORDS.Z_52KEYWORDS` and `Z_33ASSETS(Z_33ALBUMS, Z_3ASSETS)`;
on the Pro they were `Z_53KEYWORDS` and `Z_34ASSETS`. Check `pragma table_info` before querying.

## How writes work (hard-won)

- Photos is the system of record. Read `Photos.sqlite` read-only in place
  (`sqlite3.connect("file:"+quote(path)+"?mode=ro", uri=True)`). Never write the DB directly (iCloud).
- All writes are AppleScript, dropped as `.applescript` into `~/Pictures/_IA_review/runner/queue/` on
  the Air. The Terminal loop runs one at a time, logs to `runner/runner.log`, and the job logs to
  `~/Pictures/_IA_review/airlog.txt`. Finished jobs move to `done/` or `failed/`.
- Pattern: add photos to a temp album in batches of 90, fall back one at a time, then walk the album
  setting keywords (fast), then copy into the destination album. Generator: `curation/scripts/python/v3/v3gen.py`.
- Filter every photo list: `ZTRASHEDSTATE=0 AND ZKIND=0 AND ZHIDDEN=0 AND ZVISIBILITYSTATE=0 AND
  (ZCLOUDISMYASSET IS NULL OR =1)`. Shared or other-owner assets silently kill a whole batch.
- Photos jumps to the front when adding to albums. Randy hates this; that is why jobs run on the Air.
- Never `activate` Photos or `display dialog` in queued jobs.
- Air speed: ~1 keyword write per second. Plan big jobs accordingly.
- Computer-use cannot type into Script Editor/Terminal. Installing background agents needs Randy's click.

## State of the library (v3 locations)

- Every `Loc:` was rebuilt from GPS reverse-geocode (E-510 GPS ignored) + nearest anchor in a day-cluster,
  plus 229 contact sheets read by eye for blind clusters. Verdicts: `curation/verdicts/v3-cluster-verdicts.tsv`.
- Keywords: `Loc: <City, ST>` and `Place: <State or Country>` (`Place: No Location` for unknowns).
- Albums: folder **LOCATIONS** with one album per Place (41 regions) + `NO LOCATION AVAILABLE`.
- **Done:** every place except Home. NO LOCATION done (1,988).
- **Not done, by decision:** Home (DFW) tagging. Randy stopped it at ~4,600 of 32,957; tagging all of
  Home has no curation value. Home = "no Place: tag".
- **Still worth doing (small job, ~30 min on Air):** strip wrong old tags from 957 Home photos
  (`Loc: New Orleans` 102, `Guadalupe Mountains` 50, `Georgia` 49, ...; list in `~/work/home_stale.json`
  on the Air) plus 782 old tags on photos outside the live set (`~/work/strip.json`). Not queued.
- New Mexico split into `LOCATIONS/New Mexico/New Mexico - People` (190) and `- No People` (383),
  keywords `Subj: People` / `Subj: No People`. People = a face >= 0.03 of frame or a selfie Photos missed.
  This was a pilot; Randy has not asked to roll it out to other places yet.
- Leftover folders Randy should delete by hand: `_v3 stamp (temporary)`, `ZZ_AIRTEST stamp`,
  `ZZ_AIRTEST LOCATIONS`, `ZZ_TEST`, `ZZ_TESTV3*`, old `TRIPS`. Ask before deleting anything.
- Older layers still present: WORKING (60 albums) and MEMORIES (57) from v2 (named-face rule).

## Open questions for Randy (from v3)

- c128 Jul 22-26 2009: drive east across the Mississippi at Vicksburg to a family wedding. Where?
- c173 Nov 2010 stingray touch pool; c504 Mar 2023 flooded river bottom (B&W); c508 Apr 2023 pumpjacks.
- Date dumps with no derivatives: c417, c440 (includes NOLA), c095.
- Camera clocks: Kodak V1253 a year early through mid 2007; NEX-5N pre-Aug-2011 dates wrong;
  GFX50R never set (Mar-May 2018 dates; 14 frames are Ennis Apr 2026). A date-fix job was offered, not built.
- Delete: 2018 screenshot with a gate code; 2018 driver's license photo (`47DACAF0`, NM People album).

## Where curation is: Chapter 1 THRESHOLDS (just started)

Randy chose to curate **by chapter**. Method used:
1. Candidates = no-people frames (no face >= 0.03) carrying Apple scene labels from
   `database/search/psi.sqlite` (category 1500: Path, Road, Trail, Dirt Road, Lane, Bridge*, Alley,
   Railroad, Dock, Pier, Glacier, Fog, Mist, Tunnel, Arch, Stairs, Door). Asset ids decode as
   `uuid.UUID(bytes=struct.pack("<qq", uuid_0, uuid_1))`.
2. Collapse bursts (same camera, <= 75 s), keep favorite then highest `ZOVERALLAESTHETICSCORE`.
3. Real cameras only, cap 20 per place, sort by time: **360 candidates T001-T360**,
   sheets at `~/Pictures/_IA_review/ch1_thresholds/t_00..t_17.jpg` on the Air, data `~/work/thresh_pick.json`.

All 18 sheets were viewed once. **First-look shortlist, NOT graded, NOT shown to Randy yet:**

- **Paths/corridors:** T185 T186 Brinkman pecan orchard rows (place now gone); T212 T213 B&W woodland
  trail (Mar 2023, unplaced); T220 B&W boardwalk into trees (Home, Aug 2023); T242 Gordonville grass path;
  T269 Capulin rim path; T272 Nederland boardwalk; T227-T239 Caprock/Palo Duro red trails (pick one or two).
- **Roads:** T181 T182 Riverside OR double-yellow to horizon; T179 McKenzie Bridge curve; T315 Conway AR
  B&W road; T318 Salt Flat road at dusk; T357 Versailles KY B&W lane; T358 Lincoln NH wet road in color.
- **Bridges/structures:** T178 B&W covered bridge, Eugene; T184 B&W highway bridge, Temple Bar;
  T256-T258 Pikes Peak cog rails into cloud (T258 B&W strongest).
- **Interiors/apertures:** T260 T261 Estes Park hotel corridor (Stanley); T322 T323 Shinjuku walkway;
  T351 T352 Kobe alleys at night; T343-T350 Fushimi Inari torii tunnels (cut hard, it is a cliche).
- **Atmosphere:** T280-T284 Heber Springs river in fog (strongest set on the sheets);
  T304 Iceland ice-cave channel; T310 Hvolsvöllur stairs; T334 Kyoto blue-hour path; T329 Fujisawa bridge path.
- Already locked elsewhere (check Decision Log before regrading): Iceland glacier work, Where Dragons Fly, etc.
  Rule CDL-C-002: do not cold-grade a frame that is already locked.

Next step: show Randy the shortlist sheet, get his cut, grade survivors per Protocol (verdict first,
eleven scores for A- and up), then build `CHAPTERS/1 Thresholds` album + `Ch: Thresholds` keyword via
a queued job on the Air. Then repeat for Witnesses (old structures, churches, signs, abandoned), Elsewhere,
Companions (needs faces: People side), Becoming, Keeping.

## Files

- Repo: `github.com/Rla102277/theinfinitearch` (`curation/` is live; `frontend/`, `functions/` are a dead Firebase app).
- `curation/verdicts/` v3 verdicts, notes, summary. `curation/scripts/python/v3/` placement + generator.
- Do NOT run: `curation/data/final_plan.json`, `trip_gaps.json`, `04_RemoveRedundantAlbums.applescript`.
