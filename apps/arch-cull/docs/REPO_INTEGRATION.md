# ARCH CULL: repository integration and provenance contract

**Inspected against:** repository `Rla102277/theinfinitearch`, commit `a4a8fa5e227e0f930e58f5750f666e3e04b48ead` (16 October 2026).  
**Status:** Engineering interpretation of existing evidence, **not a new approved curatorial decision**.

## 1. Which source owns what?

| Source | Recorded authority / purpose | Application behavior |
|---|---|---|
| `governance/UNIFIED_PROTOCOL_v1.1.txt` | Approved operating vocabulary, philosophy, 11 dimensions, S-to-C grades, classifications | Parse as versioned policy; never auto-rewrite |
| `governance/MASTER_KNOWLEDGE_BASE_v1.0.md` | Historical cameras, Fuji recipes, Leica Looks, research, known uncertainties | Index descriptions as versioned provenance; do not infer unverified LUTs |
| `governance/CURATORIAL_DECISION_LOG_v1.0.md` | **Working reconstruction, pending photographer review** with records individually marked CONFIRMED/WORKING/DISPUTED/etc. | Preserve document-level status and per-entry statuses separately |
| `governance/README.md` | Source-of-truth location, versioning rules, discrepancies | No silent in-place edits; new versions require governance review |
| `HANDOFF.md` | Dated MacBook Air/Pro workflow and repository conventions | Use as historical operational evidence, not immutable API policy |
| `CLAUDE.md` | Explicit warning that old album names/date ranges/GPS medians failed | Visual verification, not metadata-only reconstruction |
| `curation/verdicts/album-verification.md` | 20 visually checked legacy album results | Preserve observations; earlier false album associations must not be restored |
| `curation/verdicts/v3-summary.md` | 15 Oct v3 location placement | Use dated numbers, not the 14 Oct snapshot |
| `curation/verdicts/chapters/chapters-status-2026-10-16.md` | Chapter, wide sweep, film, Japan film, Finals Print work | Import as **snapshot + provisional reviews**, not final tiers |
| `curation/scripts/` and `curation/data/` | Historical procedures, evidence, intermediate JSON | Never execute destructive/superseded scripts as an app initialization step |

### Explicitly superseded/unsafe scripts

Do not execute `curation/data/final_plan.json`, `curation/data/trip_gaps.json`, or `curation/scripts/applescript/04_RemoveRedundantAlbums.applescript`. These are retained for historical reconstruction, not production workflows. The old Firebase `frontend/` is unrelated to the new macOS app.

## 2. Snapshot denominators and avoidable numerical mistakes

The sources count different things at different times. Do **not** overwrite one count with another.

- `curation/README.md` records a **14 October** baseline: 67,636 stills and about 80,826 assets including other kinds.
- `HANDOFF.md` uses an approximate **78k photo** description.
- `curation/verdicts/v3-summary.md` reports **64,389 live frames**, of which 62,401 were placed and 1,988 had no location, for the **15 October v3 pass**.
- `curation/verdicts/chapters/chapters-status-2026-10-16.md` reports a **4,893-frame wide-sweep pool** and 1,309 selections into Maybe albums; these are not the total library.

The first PhotoKit inventory must report its own definitions: total PHAssets, still images, videos, hidden/inaccessible resources, shared assets where observable, and duplicates as **relationships** rather than deleted items. Do not force counts to agree across unlike scopes.

## 3. Preserve chapter semantics precisely

The handoff names six positions:

1. Thresholds
2. Companions
3. Witnesses
4. Elsewhere
5. Becoming
6. Keeping (**provisional**)

Protocol v1.1 lists five working chapters, omitting Keeping. The later repo records both `5 Becoming` and `6 Keeping`. Maintain the recorded later provisional position without changing Protocol v1.1. Surface a governance discrepancy requiring approval, not an automatic sixth canonical chapter.

The 16 October structure is:

`CHAPTERS/<n> <Chapter>/1 Tiered/<tier>`  
`CHAPTERS/<n> <Chapter>/2 Maybe`  
`CHAPTERS/<n> <Chapter>/3 No`

Existing keywords include `Ch: <Chapter>` and `Prov: <tier>`.

**Meaning of a folder or tag must be preserved.** `2 Maybe` means a provisional review selection, not confirmed A status. `Prov:` means a provisional tier, not a locked canonical grade. An AI must not automatically promote provisional classifications into the Curatorial Decision Log.

16 October chapter counts as recorded:

| Chapter | Tiered snapshot | Maybe | No |
|---|---|---:|---:|
| 1 Thresholds | 5 A−; 17 B+ | 46 | 291 |
| 2 Companions | 6 A−; 15 B+ | 37 | 242 |
| 3 Witnesses | 7 A−; 24 B+ | 67 | 262 |
| 4 Elsewhere | 13 A candidates marked check; 10 A−; 34 B+ | 107 | 195 |
| 6 Keeping | 2 B+ | 12 | 101 |

No corresponding 5 Becoming tiered table was recorded in that specific chapter build. The wide sweep separately records **four** provisional Becoming selections. Do not substitute these as formal chapter-build counts.

The user explicitly said to ignore locks on Elsewhere's 13 check frames: treat them as **ordinary A candidates**, not confirmed A titles/tiers.

Wide sweep selections (all reported landed): Elsewhere 581, Thresholds 335, Witnesses 283, Companions 106, Becoming 4. Sum = 1,309. Elsewhere was deliberately generous and remains to be cut hard.

## 4. Priority coverage gaps

### RAW blind spot
`widepool.py` excludes `cam in ('?', '')`. As recorded on 16 October, this excluded film scans and approximately 900 Fuji RAF/Sony ARW files whose camera tag Photos did not understand.

**New app rule:** Image eligibility must not depend on a populated camera tag. Separate `unknown camera` from `not a photograph`. Test against RAW/JPEG pairing and missing EXIF cases. Never set grade C because metadata is absent.

### Film scans
The scan tag `QSS-32_33` and laboratory filename patterns `0843017_...-R#` and `0388980_...-R#` are useful historical clues but not universal truths. The report records 339 film scans, at least 12 rolls; 128 were added to `2 Maybe (film)`. Dates and GPS can reflect **import artifacts**.

For Japan film, the status records 68 imports, 48 unique and 20 duplicate copies, with 23 Maybe selections (T 12, W 6, E 5). It explicitly warns that around 307 late-July HEIC images came from other owners via the shared library; a captured image's ownership/authorship must not be inferred from arbitrary file dimensions alone.

Preserve "Japan film DUPLICATES (delete)" as a historical album name only: **do not delete anything**.

### Oregon/Nevada
March 16–19 2022, 312 frames, 53 previously chaptered, 76 new selections (Elsewhere 27, Witnesses 22, Thresholds 20, Companions 4, Becoming 3, expressed as B in the recorded shorthand). Do not assume these 76 are confirmed tier A.

### Finals Print
16 Oct inspection of album internal pk 3827 found 429 live files, roughly 110 distinct images and 37 works satisfying the user's specific criterion `real title + white border`. These are **print-ready candidates according to the snapshot's rule**, not automatically artistic S/A grade.

Potential title collisions (do **not** silently reconcile):
- `Take Me to the River` vs `Where the River Wakes`
- `Into the Light` vs `Walking into the Light`
- `The Sky Relents` vs `The Emergence` (possible)

Three Japanese film print files were bordered but untitled. The proposed `IA: Print-ready` tag and Tiered move were **not run**. An AI should flag, not execute, title/print reconciliation. **No printer or editor features are authorized.**

### Known metadata faults
The 16 Oct report records specific mistaken location labels, including Vicksburg/Georgia Aquarium, Waxahachie/Gruene, Home/Gulf World Panama City Beach, Durango/Dewey/Jerome AZ, Las Vegas/New Orleans, Ketchikan lodge, and Pilot Point/Ray Roberts. The 15 Oct v3 report also records an unset GFX50R clock, Kodak V1253 date shift, and impossible early NEX-5N dates.

These must be preserved as **provenance warnings and review tasks**, not silently rewritten into source metadata.

## 5. Missing files from the Air: do not reconstruct fictitious mappings

The 16 October status says these remain on the MacBook Air under `~/work` or its runner: `chbuild.py`, `chcands.py`, `modes.json`, `ch*_decisions.json`, `*_pick.json`, `X_pick.json`, `orv_pick.json`, `film_pick.json`, `jp_pick.json`, `finals.json`, and the runner scripts.

`wp_compact.txt` and `orvfilm_picks.txt` are in Git, **but their compact IDs depend on pick JSON mappings not yet committed**. An importer must mark them `UNRESOLVED_SOURCE_MAP` until the real mapping files arrive. Never invent asset UUID assignments, and never infer them from list ordering without validating the original source version.

When the Air is available, import copies of missing maps into an evidence staging folder; hash originals, record machine/source timestamp, test count/integrity, and propose separate commit. Do not commit absolute machine paths or personal photographs.

## 6. Cross-Mac asset identity contract

The existing Air/Pro workflow states Photos internal UUIDs and join tables differ across machines. A new PhotoKit adapter must use its own library-local `PHAsset.localIdentifier` for live operations. This is **not** proof that a legacy UUID from another Mac identifies the same photo.

Store two identities:
- **Source identity:** source machine, source type (legacy DB, Photos AppleScript, PhotoKit, repo list), original token, capture snapshot, source file/hash.
- **Resolved live identity:** connection-specific PhotoKit local identifier and reconciliation evidence.

Require an explicit verified reconciliation step for cross-Mac imports. Potential checks: filename, dimensions, resource kind, capture date after clock-fault handling, digest when authorized, pairing and visual inspection. No single weak signal can silently confirm a match. When ambiguous, show candidates for human approval.

Preserve the original source token even after mapping so historical decisions remain auditable.

## 7. Legacy risk and new safety policy

Previously used scripts read `Photos.sqlite` in read-only mode and write via queued AppleScript on the **Air**, batching at 90 and working around hidden/shared asset failures. These methods produced real curation results and must not be disparaged as imaginary or accidentally rerun. They are tied to private schema, local derivatives and a known worker workflow.

New application must:
- Use public PhotoKit for live enumeration, preview access and supported album changes.
- Leave legacy scripts intact as audit/recovery evidence.
- Operate read-only by default.
- Avoid assuming PhotoKit can edit Photos keywords or titles.
- Avoid direct Photos package/SQLite schema dependency for its **production** data access.
- Keep old keyword/album information when reliably obtainable; report unavailable operations explicitly.
- Offer preview/dry-run/approval/idempotent verification for any future write-back.
- Never auto-delete, rename, export modified renders, print, or produce Lightroom edits.

## 8. Canonical decision edge cases

The Decision Log document itself is marked **WORKING RECONSTRUCTION**, even though some contained entries are individually `CONFIRMED`. Preserve both levels. Examples from the log:
- `Where Trolls Go to Watch the Sun Die` is the sold/locked title. Protocol v1.1's `Where Trolls Watch the Sun Die` example is explicitly flagged as wrong in the log.
- `Where the Ice Remembers` is a confirmed triptych; `The Approach` is a separately confirmed standalone presentation of its first panel.
- `Where Dragons Fly` was already locked and must not be cold-regraded as though no decision existed.
- `Where the Blue Comes From` vs `The Azure Vein` is disputed pending photographer reconciliation.

Use immutable references to the source document/version/entry. Mark proposed contradictions as DISPUTED rather than overwriting either fact.

## 9. Implementation gates

**Gate 0: source ingestion:** parser reports status, provenance, unresolved mappings and source hashes; does not convert a Maybe into a confirmed grade.

**Gate 1: PhotoKit browser:** real macOS build, auth, listing, resilient thumbnails, accurate still/video breakdown; no Photo package access or writes.

**Gate 2: comparative culling:** measured duplicate/burst grouping with independent RAW/JPEG relationships and novel-scene retention.

**Gate 3: AI critique:** exact eleven dimensions, four lenses, S-to-C grade recommendations, five confirmed-classification names, chapter confidence and abstentions. Technical and emotional judgments independent.

**Gate 4: decision export:** local append-only events, explicit human approval, versioned source export, no mutation of canonical files during routine processing.

**Gate 5: approved album sync:** separate feature flag, macOS-specific verification, user preview, exact asset list, idempotent PhotoKit changes and post-write reconciliation.

No claims of completion without executed tests on a compatible Mac.

## 10. Outstanding governance question

The source files contain a genuine conflict on the number of chapters: Protocol v1.1 lists five; the active 15–16 October curation workflow uses six positions with Keeping provisional. The software should represent **Keeping as provisional**, retain the five protocol chapters, and await a deliberate governance decision. This document does not resolve the issue.
