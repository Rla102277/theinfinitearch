# THE INFINITE ARCH — repo context

Two unrelated things live here. `frontend/`, `functions/`, `build/`, `firebase.json` are a
**dead Firebase app**. Ignore them unless asked.

Everything active is in **`curation/`**: the Apple Photos library restructure and audit for
Randy Archambault's fine art photography practice, The Infinite Arch.

## Read these first

1. `curation/README.md` — library baseline, what the scripts did, hard-won operational rules
2. `curation/verdicts/album-verification.md` — the 20 albums verified by eye, and why the
   metadata approach failed

## The one rule that matters

**Album names in this library are unreliable. Verify by LOOKING at the frames.**

`Wyoming` holds January 2016 New Orleans. `Nashville` holds a Six Flags show in Arlington.
`Arizona` holds Washington DC and Disney World. Of 20 albums checked, 3 were entirely false,
6 were thin, 11 were real but mixed. None was clean.

Every metadata approach tried on 14 Oct 2026 produced a wrong answer: album names lied, date
spans lied, frame counts lied, GPS medians lied. Rendering a contact sheet and looking at it
took ~90 seconds per album and was right every time, including on albums with zero GPS.

**Do not propose a metadata-only rebuild.** It has been tried and it failed.

## Why GPS specifically is a trap

Randy's real cameras have no GPS: X-T5, GFX100S II, GFX100RF, a6000, X-E2, X-Pro3, X100V,
E-M10. The iPhone does. So GPS correlates with snapshots and NOT with photographic work.
A GPS-anchored rebuild weights the structure toward family photos and away from the work.

- `Quanah` has 15 real frames of X-T5 caprock landscape. Its GPS median points at the house.
- `Atlanta` has ONE frame with GPS and eleven real frames. The Georgia Aquarium is obvious on
  sight and invisible to metadata.
- The **Olympus E-510 has no GPS receiver** yet its frames carry coordinates. Photos fabricated
  them. Treat any E-510 coordinate as absent.
- A GPS median breaks on compound albums: `Louisville and Seattle` reads as Kansas, the midpoint
  of two real cities plus home.

## Working method that is known to work

```
for each unverified album:
    render a contact sheet (up to 24 frames, evenly sampled, labeled with date/camera/GPS)
    LOOK at it
    record: real frame count, what is actually in it, anything worth grading
```

`curation/scripts/python/sheets.py` builds the sheets. Write verdicts into
`curation/verdicts/album-verification.md` and commit as you go, so context loss does not cost
the work.

## Photos operational rules (learned the hard way)

- **Photos is the system of record.** Read `Photos.sqlite` read-only, write back via AppleScript.
  Never build a parallel catalog.
- Add photos to albums in **batches of 90**. 100+ triggers an "Apply" dialog per batch.
- Photos **drops the entire batch** if one photo in it is a hidden burst frame. Retry in smaller
  slices and verify counts afterward.
- AppleScript **cannot move albums between folders**. Create and delete only.
- Smart albums **cannot be created** by script. Randy makes those by hand at the end.
- Photos uses **different internal IDs on each Mac**. UUID lists do not transfer.
- `Photos.sqlite` is ~2.96 GB. Do not copy it. Open in place:
  ```python
  sqlite3.connect("file:" + urllib.parse.quote(path) + "?mode=ro", uri=True)
  ```
- Core Data epoch to unix: `+978307200`
- Derivatives: `resources/derivatives/masters/<X>/<UUID>_4_5005_c.jpeg` and
  `resources/derivatives/<X>/<UUID>_1_105_c.jpeg`
- `search/leo.sqlite` has `items` and `lexicon`; `lexeme_ids` is a packed little-endian uint32
  array. Lexeme **3164** is the Grave/Tomb/Headstone cluster.

## Do not run

- `curation/data/final_plan.json` — an 11,418-membership sweep built on the unverified album
  names. It would file thousands of frames under labels now known to be wrong.
- `curation/data/trip_gaps.json` — superseded, inflated by contaminated date spans.
- `curation/scripts/applescript/04_RemoveRedundantAlbums.applescript` — built, never run,
  superseded by moving folders to OLD instead of deleting.

## State as of 14 Oct 2026

Done: 20 albums verified by eye. 40 remain.

Open items are listed at the bottom of `curation/README.md`. The notable ones:
- The Feb-2015 New Orleans cemetery day (72 frames, no GPS) is still outside the structure,
  and 3 of its frames are misfiled under San Antonio.
- No `IA:` grades or `Ch:` chapters have been written yet.
- Nine sets of previously invisible photographic work were found and are listed in the
  verification doc. The largest is 12+ frames of Arlington National Cemetery in the rain
  (Feb 2016, a6000) filed under `Virginia`.

## How Randy wants to be talked to

He is a Director of Data & Integration. He will catch a bad number and he would rather be
challenged than flattered. Push toward fewer, stronger images. Never call an image good
without saying why. If something is merely pretty, say so.

**No em dashes, ever.** Direct, first-person, no AI-sounding filler. ALL CAPS from him is
emphasis, not anger.
