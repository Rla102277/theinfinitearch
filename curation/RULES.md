# Curation rules (set 21 Oct 2026)

These apply to every sweep, cut and script. They come from Randy, not from inference.

## What never goes into the portfolio
- Children performing or posing (stage shows, recitals, portraits). They stay out of Maybe, and hidden ones stay hidden.
- Private material: wedding, birth, former partners, ID documents (license, passport). Never picked, never in an album.
- Hidden stays hidden. A hidden frame may be put in a Maybe album, but Randy unhides by hand only if it earns it.

## Whose camera it is
Randy's bodies (from Randy, 21 Oct 2026):
- Olympus: E-510, E-M10 Mark I, Mark II, Mark III
- Sony: NEX-5, NEX-5N, NEX-5R, NEX-5T, a6000 (ILCE-6000), DSC-WX9
- Fujifilm: X-T5, X-T2, X-Pro3, X-E2, X-E4, X-E5, X100V, X100VI, GFX100RF, GFX100S II, GFX 50R, X-T100 (trial body), possibly X-M5
- Nikon: D3400
- Leica: Q2, Q3 43
- Earlier digital (confirmed 21 Oct 2026): Kodak V1253, Kodak DX6490, Fujifilm FinePix E900, Canon PowerShot SD600 / SD880 IS / S2 IS / A85 / SD100, Canon EOS 20D, Canon EOS 30D, Panasonic DMC-ZS3, Sony RX100, Sony RX100M2, Sony Mavica (the honeymoon frames are his but stay private and hidden)
- Film bodies (not in metadata): Klasse W, Natura Classica, Hexar RF, X-700, Electro 35 GSN

Not Randy's: Nikon D7000 (Cabo charter photographer, tag `Src: Tour photographer`), Nikon D1X (wedding coverage), Nikon D700, D70s.

Unconfirmed, ask before treating as his: Fujifilm X-M1, FinePix S5000, Canon EOS Rebel T6, Sony a5100, Sony HX5V.

Not in Photos at all as of 21 Oct 2026: E-M10 Mark I, Leica Q2, X-M5.

Known bad clocks: GFX 50R (stamped 2018), E-M10 Mark II (all 673 frames stamped 27 Oct 2018), Canon ZV-223 (2000-01-01), Maginon / Coolpix AW130 (2015-01-01). Never trust a date window for these bodies.

iPhones carry GPS, the real cameras do not. GPS correlates with snapshots, not with the work. E-510 coordinates are fabricated by Photos; treat them as absent.

## Quotas (for every cut)
- Maybe per trip per chapter: 10 maximum.
- Same subject (one building, one sign, one view): 3 maximum in Maybe, 1 in Tiered.
- A sweep is not finished until its cut is done. No new sweep starts while a cut is open.

## How a pick is recorded
Every committed pick carries UUID, original filename, camera and local capture date
(`index/picks_resolved.csv`). Sheet numbers like `nola 0485` are only working labels.

## Writing to Photos
- Photos is the system of record. The index (`ia_index.sqlite`, built by `buildindex.py`) is a read-only snapshot, rebuilt each run, never edited.
- Scripts are written to `runner/pending` and run only when Randy says, on the Mac whose database produced the ids.
- Keywords (CDL-C-014, 21 Oct 2026):
  - `IA:` S / A+ / A / A− / B+ / B / C
  - `Role:` Anchor / Support / Developmental / Personal Archive / Exclude
  - `Ch:` Thresholds / Companions / Witnesses / Elsewhere / Becoming / Keeping (Keeping confirmed 21 Oct)
  - `Motif:` Threshold, Passage, Road, Path, Arch, Bridge, Horizon, Solitude, Memory, Mythic, Old Structure, Human Mark, Outside Time
  - `Form:` Interior / Subtraction
  - `Light:` Fog / Dusk / Night / Overcast / Golden / Midday
  - `Event:` Second Line, Parade, Festival, Street Music, Ritual, plus Becoming milestones
  - `Prov:` Maybe / No (workflow only). `Place:`, `Loc:`, `Src:`, `Legacy: Starred` kept.
  - IA, Role, Motif, Form, Light are applied by eye during the cut, never in bulk.
- Retired (CDL-C-015): `has people`, `has no people`, `core_keep`, `landscao`, `landscape`, `Kind:*`, old `Legacy:*` and `Known Best*` after folding into `Legacy: Starred`.
