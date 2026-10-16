# CURSOR MASTER IMPLEMENTATION PROMPT: ARCH CULL

> Paste the text below into Cursor Agent while this repository is open. This is an **implementation request**, not authority to alter curated photographs or canonical decisions.

## BEGIN CURSOR PROMPT

You are the lead macOS, PhotoKit, machine-learning and preservation engineer for THE INFINITE ARCH. Build **ARCH CULL**, a native Swift/SwiftUI, local-first photographic comparison and curation app **inside this existing repository**, under `apps/arch-cull/`. The Apple Photos library remains the original-asset system of record. No editor, printer, firmware tool, Lightroom converter, or second image repository.

**Start from the checked-out repository, not a blank template.** Read the following in this order:

1. `CLAUDE.md`, `HANDOFF.md`
2. `curation/README.md`, `curation/verdicts/album-verification.md`, `curation/verdicts/v3-summary.md`
3. `curation/verdicts/chapters/chapters-status-2026-10-16.md`
4. `governance/README.md`, `governance/UNIFIED_PROTOCOL_v1.1.txt`, `governance/MASTER_KNOWLEDGE_BASE_v1.0.md`, `governance/CURATORIAL_DECISION_LOG_v1.0.md`
5. `apps/arch-cull/README.md`, `apps/arch-cull/docs/REPO_INTEGRATION.md`
6. Existing `curation/scripts/python/`, `curation/scripts/applescript/`, relevant JSON and TSV outputs; optionally separately supplied `Archive.zip` of earlier CLIP/Python organizers.

Before changing code, inventory and report actual implementation status, what is historical, what is verified, what is provisional and what is missing. Respect **the latest known commit** and recheck main for new curation work before proposing merge.

### Mandatory preservation and boundaries

- **Never run** `curation/data/final_plan.json`, `curation/data/trip_gaps.json`, or `curation/scripts/applescript/04_RemoveRedundantAlbums.applescript`.
- **Do not change** existing scripts, evidence, pick lists, verdicts or `governance/` during your initial development slice.
- Historical SQLite read-only extraction and AppleScript queue on the MacBook Air are **legacy workflows**; respect their past work but do **not** build the new app using direct private `Photos.sqlite`, `search/psi.sqlite`, `leo.sqlite`, derivatives directories, internal join tables, or writes inside `.photoslibrary`. The supported live adapter uses **PhotoKit**.
- Build the new app without touching historical Firebase `frontend/`, `functions/`, or `build/`.
- **No destructive writes**, no images uploaded without explicit opt-in, no guessed Photoshop/Photos keywords write support, no automatic delete, title change, favorites change, RAW transformation or print function.
- New album changes are deferred until a later feature-flagged phase with dry-run, approval, verification, retry and audit trail.
- Existing confirmed image titles, editions and grades remain authoritative. The Decision Log file is itself a WORKING RECONSTRUCTION; preserve the status of individual entries and source versions separately.

### Artistic rubric, implemented as policy not model folklore

Honor the exact Protocol v1.1 language: four roles (Scholar, Photographer, Critic, Great Curator); four critical perspectives (museum curator, gallery owner, national exhibition juror, collector); eleven scored dimensions (composition, light, visual weight, emotional impact, symbolism, storytelling, printability, gallery appeal, commercial appeal, originality, longevity); grades **S, A+, A, A−, B+, B, C**; classifications **Exhibition Anchor, Exhibition Support, Developmental Work, Personal Archive, Exclude**. Grades are holistic, never arithmetic averages. AI outputs are proposals and may abstain. Maintain evidence versus interpretation, technical versus emotional merit, approved versus working decisions. Do not elevate matching subject keywords into proof of artistic importance.

The guiding statement is **"I don't photograph destinations. I photograph thresholds."** Evaluate *Ma*, invitation, interiority, visual structure, narrative openness and meaningful subtraction as diagnostics, never automatic grade gates. Preserve the working five Protocol chapters Thresholds / Companions / Witnesses / Elsewhere / Becoming **and the separately documented provisional sixth position Keeping**. Do not silently resolve this conflict; expose it in governance reporting.

Track and distinguish camera/Look provenance: Fuji C1–C7 Invitation/Witness/Memory/Truth/Presence/Threshold/Stillness, Leica historically versioned Looks, film versus digital, RAW+JPEG companions, scans, camera-specific renderings and unknowns. **Do not claim a Look from color appearance alone**. Use actual source configurations when available.

### Existing review history that MUST survive

- Old album names proved unreliable; visual contact-sheet verification is necessary. GPS may help establish *where* a scene was shot, **not artistic worth**. Some camera clocks and film-scan import dates are wrong.
- 15 Oct v3 location pass: 64,389 live frames, 62,401 placed, 1,988 no location. This is a pass-specific count, not the whole library size.
- 16 Oct chapter tiers, Maybe, No and `Ch:`/`Prov:` keywords: treat `Maybe` and `Prov:` as **provisional**. `Elsewhere` has 13 ordinary A *candidates* previously labeled `check`; photographer explicitly said ignore locks.
- Wide sweep: 4,893 inspected; 1,309 Maybe additions split E581/T335/W283/C106/B4; Elsewhere needs a harder cut.
- Approximately 900 RAF/ARW frames plus film scans missed by a camera-`?` filter: make missing-camera discovery a core requirement.
- Film scans 339 / 128 Maybe; Japan film 68 imports = 48 unique + 20 duplicates, 23 Maybe; do not delete even when an album is named `DUPLICATES (delete)`.
- Finals Print 429 live files, about 110 distinct works, 37 meeting a title+white-border readiness test. Proposed `IA: Print-ready` write-back **did not run**. Print-ready is not automatically grade A.
- MacBook Air-only missing `*_pick.json`, `X_pick.json`, `ch*_decisions.json`, runner files and builders must remain **unresolved references** until exact original mapping files are supplied and integrity-checked. Do not invent UUIDs or reconstruct ambiguous IDs from assumed order.
- 16 Oct source lists several false locations and conflicting printed titles. Surface review tasks, not silent corrections.
- Cross-machine Photos asset identifiers require evidence-based reconciliation. Record source machine, source token, derived identity candidate, matching signals and human resolution.

### Production architecture

Native **Swift + SwiftUI** macOS application in `apps/arch-cull/`. Use public **PhotoKit** for image and album access, **Vision/Core ML** for on-device measurable features where supported, **SQLite** for rebuildable analysis index and local review events, bounded async tasks for thumbnails and batch jobs. Use Core Image/ImageIO/Accelerate only where justified. Do not assume a PyTorch MPS process uses the Apple Neural Engine. Verify SDK names and entitlements against the actual Xcode installed. Abstract optional local vision-language models (e.g., MLX/Ollama) behind a provider interface; the app must launch and browse without one.

Separate:
- PhotosLibraryAdapter
- LibraryIdentityResolver
- InventoryAndResourceIndex
- ThumbnailAndCacheService
- FeatureAndEmbeddingPipeline
- DuplicateBurstSequenceEngine
- ArtisticPolicyAndCritiqueEngine
- ChapterAndPortfolioEngine
- ProvenanceAndDecisionImporter
- HumanReviewAndDecisionJournal
- ApprovedAlbumSyncEngine (disabled in first phases)
- AppDiagnostics

Image originals stay in Apple Photos. DB contains versioned metadata snapshots, local identifiers scoped to their library, cache references, similarity/RAW relationships, AI proposals, human events and evidence. It is **not** a parallel image system of record. Support multi-Mac and iCloud optimization gracefully: cloud-only is not failed, shared/hidden is not worthless, no original download sweep. Query PhotoKit capabilities rather than guessing keyword/title write access.

### UX objectives

Quiet, visual native UI: Library / Inbox / Duplicates / Bursts / Discover / Critic / Chapters / Portfolio Wall / Decision Log / Sync / Settings. The initial release should only implement **Library**, a working asset grid, single-asset viewer, metadata overlay and selection/review state. Later support keyboard-driven side-by-side comparisons, synchronized zoom, burst comparison, technical and artistic winners separately, RAW/JPEG pairing, meaningful semantic retrieval, novelty-based Hidden Gems exploration, and sequenced chapter wall. Protect personal photos independently of exhibition merit.

### Robust pipeline

0. PhotoKit inventory with real counts and asset identities.
1. Bounded previews, metadata and resource availability.
2. Technical signals (not verdicts).
3. Efficient candidate-based perceptual duplicate/burst/similarity grouping, **not O(N²)**.
4. Versioned embeddings with semantic index and local-model fallback.
5. Fine-art relevance detection with outlier exploration.
6. Deep eleven-dimensional critique only for shortlisted/uncertain/human-selected assets.
7. Explicit human review and append-only event recording.
8. Separate approved album synchronization, feature-flagged and independently tested.

Every AI evaluation must include model/policy version, observation, interpretation, uncertainty, reason, suggested tier and proposed chapter/classification. Human approval must not be confused with an inference. Never equate Apple aesthetic score to grade.

### Engineering output and gates

**Phase 0: inspect and document.** Write an executable architecture, old-code audit, source-to-live identity contract, governance importer schema, threat/safety assessment, macOS SDK feasibility findings, and acceptance tests. Flag missing Air pick maps as blocked.

**Phase 1: BUILD AND RUN** the narrowest real vertical slice: native app -> PhotoKit request -> real library still/video enumeration -> SQLite persistence -> restart recovery -> thumbnail grid -> single asset -> metadata/source-info panel. A synthetic fixture adapter is allowed for CI, but **not** as a substitute for the real PhotoKit adapter. Do not claim it runs until actual macOS build and tests pass. Add Swift unit tests for database migrations, identity ambiguity, decision states, permission failures and resumable indexing.

**Phase 2:** burst/duplicate/variant comparison and preserved review history. Implement explicit RAW/JPEG and scan-group handling; never delete.

**Phase 3:** model-backed artistic critique + eleven dimensions + uncertainty, chapter recommendations, human veto and audit record.

**Phase 4:** embedded/semantic search, Hidden Gems, portfolio sequencing, selective album syncing and empirical model calibration after appropriate approval.

Every phase needs measurable acceptance criteria. Capture app indexing throughput, query latency, memory ceiling, checkpoint recovery and false-match rates; **do not fabricate benchmarks or grade accuracy**.

### First execution steps

1. Run `git status`; verify current branch and review new commits.
2. Read all specified source files; inspect source code and report actual coverage.
3. Create `apps/arch-cull/docs/ARCHITECTURE.md`, `LEGACY_AUDIT.md`, `PHOTO_IDENTITY.md`, `DATA_MODEL.md`, `TEST_PLAN.md` and a phase plan tied to verified source claims. Do not mutate governance.
4. Validate Xcode, macOS target and public PhotoKit APIs.
5. Build an isolated SwiftUI app and PhotoKit adapter, schema+migrations, read-only asset browser and persistent progress checkpoint.
6. Compile, test and fix. Log precisely what can/cannot yet be demonstrated.
7. Commit scoped work to a feature branch and open a **reviewable pull request**, not a force push to main.
8. Report concrete next work and unresolved data/permission issues. Continue iteratively beyond docs when the environment supports implementation.

**Start implementing. Do not stop at planning.**

## END CURSOR PROMPT
