# Chapters, wide sweep, film and Finals Print: status 16 Oct 2026

All work below ran on the **MacBook Air** through the runner (`~/Pictures/_IA_review/runner`,
START.command loop). Every count was verified from `chlog.txt` and/or Photos.sqlite.

## 1. Chapter build (15 Oct, 22:56)

`CHAPTERS/<n> <Chapter>/1 Tiered/<tier>`, `2 Maybe`, `3 No`. Keywords `Ch: <Chapter>` and `Prov: <tier>`.

| Chapter | Tiered | Maybe | No |
|---|---|---|---|
| 1 Thresholds | 5 A-, 17 B+ | 46 | 291 |
| 2 Companions | 6 A-, 15 B+ | 37 | 242 |
| 3 Witnesses | 7 A-, 24 B+ | 67 | 262 |
| 4 Elsewhere | 13 "A (check: locked title?)", 10 A-, 34 B+ | 107 | 195 |
| 6 Keeping | 2 B+ | 12 | 101 |

Randy: ignore locks. The 13 "check" frames are ordinary A candidates.

## 2. Wide sweep (15 Oct, 23:29): `2 Maybe (wide sweep)`

Pool: 4,893 real-camera, no-face compositions never seen by a chapter pass (`widepool.py`,
`widesheets.py`, 102 sheets of 48). All sheets read by eye. Picks in `wp_compact.txt`
(ids are X0001..X4893 in time order from `X_pick.json` on the Air).

Elsewhere 581, Thresholds 335, Witnesses 283, Companions 106, Becoming 4. Total 1,309, all landed.
Elsewhere is generous on purpose and needs a hard cut.

**Gap found:** the sweep dropped every frame with camera `?`. That excluded all film scans and
~900 Fuji .RAF / Sony .ARW files whose camera tag Photos never read. The RAW pool is still unswept.

## 3. Oregon / Nevada (15 Oct, 23:50): `2 Maybe (Oregon Nevada)`

One trip, 16 to 19 Mar 2022: Eugene, Heceta Head / Florence, McKenzie River (Sahalie Falls,
covered bridges), Sisters, US-95 across Nevada (Winnemucca, Austin), Las Vegas, Hoover Dam,
then Winslow and Petrified Forest / Painted Desert AZ on 19 Mar. 312 frames, all cameras, faces
included; 53 already chaptered. Added 76 (E 27, W 22, T 20, C 4, B 3). Picks: `orvfilm_picks.txt`.

## 4. Film (15 Oct, 23:50): `FILM / All film scans`, keyword `Src: Film scan`

Signatures: Noritsu `QSS-32_33` camera tag; lab order filenames `0843017_...-R#` and
`0388980_...-R#`. Dates and locations on every scan are import artifacts, not truth.
339 scans, at least 12 rolls: New Orleans, Colorado (Silverton, San Juans, Old Hundred mine),
Ketchikan lodge, Maine (Nubble Light, Perkins Cove), Texas longhorns, B&W Oregon/Nevada (shot
alongside the X-Pro3), Kentucky distilleries, Zoe senior portraits, Puerto Vallarta, Cadillac
Ranch, Palo Duro, Dominican Republic disposable. Added 128 to `2 Maybe (film)`.

## 5. Japan film (15 Oct, 23:58): `FILM / Japan 2026 (film)`

No camera, 3090x2048 JPEG, imported 25 and 26 Jul 2026 (in Japan). 68 imports = 48 unique +
20 duplicates (second copies in `FILM / Japan film DUPLICATES (delete)`). Fushimi Inari,
Kurama/Kifune, Chureito + Fuji, Dotonbori, Gion. No Tokyo or Fuji-climb film in the library.
23 to `2 Maybe (film)`: T 12, W 6, E 5.

Not film: ~307 late-July HEICs are someone else's iPhone frames via shared library
(ZCLOUDISMYASSET=0, no local original). The 7290x4471 TIF is Guadalupe Peak.

## 6. Finals Print album (Photos album pk 3827) reviewed 16 Oct

429 live files, ~110 distinct images. Rule from Randy: print-ready = real title + white border.
37 distinct works qualify. Issues:
- Same frame, two titles: Take Me to the River / Where the River Wakes; Into the Light /
  Walking into the Light; possibly The Sky Relents / The Emergence.
- Bordered but untitled: 3 Japan film prints (0001, 0023, 0024), Preservation Hall
  (X-T5 _010431), Archambault Musique 24in (GFX100RF _010141).
- Three title systems in use: "Where...", "The...", "Funky Moderno".
- Several finished prints were placed in Maybe by the blind sweeps (Where the Trees Keep the
  Sea, Where the Light Is Left On, Walking into the Light, Where the Road Stops Explaining,
  the three Japan prints). Proposed, not run: tag the 37 `IA: Print-ready` and move to Tiered.

## Location errors found, not fixed
- "Vicksburg" Oct 2011 is Georgia Aquarium
- "Waxahachie" Dec 2012 is Gruene
- "Home" Jun 2013 is Gulf World, Panama City Beach
- "Durango/Dewey" Jul 2019 is Jerome AZ
- "AK" Aug 2022 is the lodge near Ketchikan
- ~10 NO LOCATION frames are Pilot Point / Ray Roberts
- "Las Vegas" Mar 2024 is New Orleans (St. Louis Cathedral, Pirates Alley)

## Not in this repo yet (only on the Air, `~/work`)
`chbuild.py`, `chcands.py`, `modes.json`, `v3gen.py` HDR, `ch*_decisions.json`, `*_pick.json`,
`X_pick.json`, `orv_pick.json`, `film_pick.json`, `jp_pick.json`, `finals.json`, and the runner
(`runner.sh`, `START.command`). Copy them in next time the Air is linked; the pick lists above
only resolve to UUIDs through those json files.
