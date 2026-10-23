# ARCH CULL | THE INFINITE ARCH

**Status:** Architecture and Cursor implementation brief, not a functioning application.  
**Repository:** [Rla102277/theinfinitearch](https://github.com/Rla102277/theinfinitearch)  
**Starting snapshot:** `a4a8fa5`, 16 October 2026

ARCH CULL is a proposed **local-first, native macOS culling and curatorial intelligence application**. It will work with the existing Apple Photos library and the repository's verified photographic history. It is **not** an editor, printer, Lightroom replacement, or second managed image library.

## Read this before implementation

1. [The Cursor build prompt](CURSOR_BUILD_PROMPT.md): executable engineering brief.
2. [Repository integration and provenance](docs/REPO_INTEGRATION.md): verified history, status, contradictions and migration constraints.
3. [Current chapter-status record](../../curation/verdicts/chapters/chapters-status-2026-10-16.md): primary record of the 15–16 Oct review, not a final grade ledger.
4. [Curation workflow](../../curation/README.md), [handoff](../../HANDOFF.md) and [Claude guidance](../../CLAUDE.md): previous work, experiments and known operational pitfalls.
5. [Unified Protocol v1.1](../../governance/UNIFIED_PROTOCOL_v1.1.txt), [Master KB](../../governance/MASTER_KNOWLEDGE_BASE_v1.0.md) and [Curatorial Decision Log](../../governance/CURATORIAL_DECISION_LOG_v1.0.md): authoritative artistic governance with status and version distinctions.

**Do not modify existing governance, pick lists, verdicts, legacy scripts or Photos assets in the first development phase.**

## System-of-record contract

| Responsibility | Owner |
|---|---|
| Originals, Photos assets, albums, native metadata | **Apple Photos** |
| Historical evidence and versioned artistic decisions | **Repository `curation/` + `governance/`** |
| Rebuildable analysis index, embeddings, similarity groups, cached previews | ARCH CULL local cache |
| New proposed AI evaluations | ARCH CULL proposals, versioned and auditable |
| New human confirmations | Append-only decision events, exportable to a reviewed repository record |
| Approved album operations | Apple Photos through supported API changes, after explicit preview/approval |

A rebuildable SQLite index is **not a parallel source of truth**. It contains references, relationships, generated features and curation state, not duplicate image originals. Existing repo decision records are imported with immutable provenance; any newly confirmed decision is recorded without rewriting their history.

## Repository boundaries

- `curation/`: existing active Apple Photos audits, historical Python/AppleScript scripts, contact sheets, data, selections, notes and verdicts. Preserve.
- `governance/`: versioned artistic philosophy, policy, KB and Decision Log. Preserve, do not silently edit.
- `frontend/`, `functions/`, `build/`, `firebase.json`: historical Firebase site. **Not ARCH CULL.** Do not reuse it as the desktop UI.
- `apps/arch-cull/`: proposed new macOS application and its isolated implementation materials.

## Non-negotiable safety

- Use documented **PhotoKit** for the new live macOS library adapter, Vision and Core ML for feasible on-device analysis.
- No Photos package traversal or direct access to `Photos.sqlite` in the production adapter. Legacy read-only SQLite reports are historical evidence, not the intended app integration.
- No library delete, asset rename, modification, import, retouch, processing or print functions.
- No unapproved Photos writes. Start read-only. Explicit approval, dry-run diff, idempotence and verification are required before enabling new album writes.
- A missing asset, cloudy preview, bad camera clock, unidentified scan, inaccessible RAW or face-free scene is **not** an artistic rejection.
- Never equate a `2 Maybe` selection, `Prov:` tag, Apple aesthetic score, favorite flag, print-ready marker or historic chapter placement with a confirmed S/A+/A grade.

## Design principle

> I don't photograph destinations. I photograph thresholds.

The critical engine must separate **technical quality**, **artistic strength**, **portfolio role**, **personal significance**, **uncertainty**, and **human approval**. Enforce the exact S, A+, A, A−, B+, B, C tier vocabulary, eleven dimensions, four perspectives and curatorial classifications from the governing protocol. Grades are not numeric averages. An AI's opinion never supersedes a recorded confirmed decision.

The repository's working chapter structure includes `1 Thresholds`, `2 Companions`, `3 Witnesses`, `4 Elsewhere`, `5 Becoming`, and **provisional `6 Keeping`**. Protocol v1.1 names five chapters; the later repository handoff adds Keeping. Preserve both dated sources, expose Keeping as provisional, and require photographer approval to formalize or retire it.

## First functional slice

1. Build a standalone macOS SwiftUI application in `apps/arch-cull/`.
2. Request PhotoKit authorization and enumerate a **small selected batch** of real assets.
3. Build a bounded local index of PhotoKit local identifiers, capture metadata, resource availability and previews.
4. Show a fast grid, single-image viewer and read-only provenance overlay.
5. Add a fixture-based importer for repo evidence, keeping **proposals, confirmed decisions and unresolved records distinct**.
6. Implement durable checkpoints, error reporting and restarting without losing work.
7. Compile and run tests on an actual compatible Mac before claiming completion.

**Do not first build an AI chatbot dashboard.** Ship a working, safe library/browser slice, then add duplicate and sequence comparison, and finally the fine-art intelligence.

## Major known gaps

- The 16 October wide sweep excluded camera-`?` frames, including film scans and approximately 900 Fuji RAF/Sony ARW resources. A missing camera model must never exclude an asset from discovery.
- The Japan film batch has 68 imports, 48 reported unique and 20 duplicate copies. A folder name containing "delete" is not a deletion authorization.
- The Finals Print album has 429 live files but approximately 110 distinct works; 37 qualified under a documented print-ready rule. **A proposed 37-work tag/move was not executed**.
- Historical `Photos.sqlite` UUIDs differ on the Air and Pro. Do not treat imported machine-local IDs as automatically portable.
- The Air was the historical Photos automation worker; the Pro should not be commandeered for legacy Photos write jobs. New native app writes are disabled until specifically approved.

## Cursor kickoff

Open this repository in Cursor and tell its agent:

```text
Read apps/arch-cull/CURSOR_BUILD_PROMPT.md, apps/arch-cull/docs/REPO_INTEGRATION.md,
CLAUDE.md, HANDOFF.md, curation/verdicts/chapters/chapters-status-2026-10-16.md,
and governance/README.md. Then execute Phase 0 and the Phase 1 thin vertical
slice of ARCH CULL. Preserve all existing curation and governance artifacts.
Build/test on macOS; if compilation is not available, stop short of claiming
a working app and report the precise blocker.
```
