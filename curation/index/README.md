# Library index, 21 Oct 2026

`buildindex.py` reads Photos.sqlite read-only on the MacBook Pro and writes `ia_index.sqlite`
(81,301 items: every asset incl. hidden, shared library and Recently Deleted). The sqlite lives on the Pro at
`~/Pictures/_IA_review/_work/index/` (38 MB, not committed). Columns: uuid, original filename, make, model, lens,
UTC and local capture date, EXIF timestamp, Olympus month/day decoded from the filename, added date, size, kind,
hidden, trashed, shared, favorite, GPS, burst id, albums, keywords, in_chapters, and which sweep pools have seen it.

- `camera_inventory.csv`: every make/model with counts, date span, hidden, deleted, shared, chaptered.
- `picks_resolved.csv`: all 1,571 sweep picks resolved to UUID, filename, camera, date. All are in a Maybe album.
  Not included: wide sweep, Oregon/Nevada, film and Japan picks (their pick json lives on the Air).
- `place_proposals.csv`: 703 real-camera (incl. the older digital bodies confirmed later on 21 Oct) frames with no Place keyword where every GPS frame within 3 hours
  agrees on one Place. Feeds `runner/pending/15_PlaceFixes.applescript`.

## Findings
- E-M10: Mark III 2,437 frames (Sep 2017 to Sep 2019, 1,633 hidden). Mark II 673, all stamped 27 Oct 2018 (658 hidden).
  Mark I: none. No Olympus frame of any body is dated or named for 9 to 12 Mar 2020. The Cabo E-M10 frames are not in Photos.
- Real-camera frames (Randy's bodies, visible stills): 39,844. 20,108 have a Place keyword, 682 more can be inferred
  from nearby GPS. About 19,000 have no GPS anchor within 3 hours and need contact sheets.
- The Place/Loc keywords that exist are largely right (New Mexico, New Hampshire already tagged correctly).
  The location errors found during sweeps were in album names and trip windows, not keywords.
  Exception: 349 frames carry `Loc: AK`, fixed to `Loc: Ketchikan, AK` in script 15.
- Recently Deleted holds 2,427 items (1,628 from real cameras), mostly deleted 15 and 18 Oct. They purge 30 days after deletion.
