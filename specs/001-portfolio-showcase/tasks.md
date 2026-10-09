# Tasks: Samin Yasir Systems Portfolio Showcase

**Feature**: Samin Yasir Systems Portfolio Showcase  
**Branch**: `001-portfolio-showcase`  
**Plan**: [plan.md](plan.md) | **Spec**: [spec.md](spec.md)  
**Status**: Ready for Implementation  

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project repository initialization, Hugo scaffolding, and base theme setup.

- [x] T001 Initialize Git repository in project root (`git init`)
- [x] T002 Add PaperMod theme as a Git submodule in `themes/PaperMod`
- [x] T003 Create directory structure: `archetypes/`, `assets/css/extended/`, `config/_default/`, `content/projects/`, `content/posts/`, `data/`, `layouts/partials/`, and `static/images/`
- [x] T004 [P] Create `.gitignore` ignoring Hugo build artifacts (`/public/`, `/resources/`, `.hugo_build.lock`)
- [x] T005 [P] Create Cloudflare Pages build configuration documentation in `README.md` (specifying build command `hugo --gc --minify`, publish directory `public`, `HUGO_VERSION=0.125.0`, and Cloudflare Web Analytics enablement)

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Global site configuration, theme parameters, core styling constraints, and credential data.

- [x] T006 Configure core Hugo site settings, title, baseURL (`https://saminyasir.dev/`), theme (`PaperMod`), and profileMode in `config/_default/hugo.yaml` per `specs/001-portfolio-showcase/data-model.md`
- [x] T007 Configure social links (GitHub, LinkedIn, Email mailto), social metadata parameters (`params.socialMeta`), Cloudflare Web Analytics token (`params.cloudflareAnalytics.token`), and Web3Forms access key in `config/_default/hugo.yaml`
- [x] T008 Implement strict layout ergonomics in `assets/css/extended/custom.css` (enforcing reading column width 65–75 chars / `max-w-2xl` ~680px, line-height 140%–160%, minimum touch target size 44x44px, and 16px mobile input font size)
- [x] T009 [P] Implement code block safety rules in `assets/css/extended/custom.css` enforcing `overflow-x: auto; white-space: pre;` to prevent viewport overflow
- [x] T010 [P] Create credential metadata for FlyRank Certified Graduate Badge in `data/credentials.yaml`
- [x] T011 [P] Place FlyRank badge SVG asset in `static/images/flyrank-badge.svg`
- [x] T012 Create credentials partial template in `layouts/partials/credentials.html` rendering the FlyRank badge as an active link with target="_blank" and rel="noopener noreferrer" pointing to `https://flyrank.com/verify/YOUR_ID`

**Checkpoint**: Core foundation and CSS layout guards complete. Content and user stories can now be implemented.

---

## Phase 3: User Story 1 - Rapid 30-Second Technical Qualification (Priority: P1) 🎯 MVP

**Goal**: Deliver the above-the-fold identity hierarchy (Level 1 Name, Level 2 Role, Level 3 Focus Statement) and instant contact channels to qualify relevance within 15–30 seconds.

**Independent Test**: Navigate to the homepage root; verify Level 1 (28–32px bold), Level 2 (18–20px medium), and Level 3 (15–16px muted) text renders immediately with high contrast, and social/contact links are operational.

### Implementation for User Story 1

- [ ] T013 [US1] Create homepage root archetype/index content in `content/_index.md` with page title and metadata
- [ ] T014 [US1] Customize hero header layout in `layouts/index.html` enforcing Level 1 ("Samin Yasir"), Level 2 ("Backend & Systems Engineer"), and Level 3 ("Building resilient concurrent pipelines, adapter seams, and distributed event systems.")
- [ ] T015 [US1] Implement social navigation actions (GitHub, LinkedIn, direct Email) in `layouts/index.html` ensuring minimum 44x44px touch targets
- [ ] T016 [US1] Verify that hero text measure does not exceed 75 characters per line (`max-w-2xl`) across wide screens

**Checkpoint**: User Story 1 (MVP) is fully functional and delivers an immediate 30-second technical qualification experience.

---

## Phase 4: User Story 2 - Deep Architectural Case Study Inspection (Priority: P2)

**Goal**: Deliver structured project cards showcasing real-world systems engineering (Social Media Studio) with explicit architectural trade-offs, edge-case failure handling, idempotency, and verifiable proof points.

**Independent Test**: Navigate to the Featured Work section; inspect the Social Media Studio card and verify presence of technology stack badges, 1-sentence outcome, idempotency bullet, fault tolerance bullet, quantified metrics, and functional deep-dive/repo links.

### Implementation for User Story 2

- [ ] T017 [P] [US2] Create structured project card data in `data/projects.yaml` defining Social Media Studio (stack: Elixir, Oban, PostgreSQL, Docker, Telegram Bot API; outcome; architectural highlights: PostgreSQL partial unique index & Oban HTTP 429 snooze; metrics: 100% duplicate suppression)
- [ ] T018 [US2] Implement structured project card partial component in `layouts/partials/project-card.html` rendering Title, Timeline, Badges, 1-Sentence Outcome, Architectural Highlights, and Action Links
- [ ] T019 [US2] Add Featured Work section to homepage in `layouts/index.html` iterating over `data/projects.yaml`
- [ ] T020 [P] [US2] Create in-depth case study markdown article in `content/projects/social-media-studio.md` detailing architecture, ExUnit transcripts, test matrices, and trade-offs
- [ ] T021 [P] [US2] Create engineering log article in `content/posts/enforcing-idempotent-delivery.md` covering distributed queues and partial unique indexes
- [ ] T022 [P] [US2] Create engineering log article in `content/posts/domain-driven-elixir-architectures.md` covering domain boundaries and resilience
- [ ] T023 [US2] Add Engineering Logs section to homepage in `layouts/index.html` displaying recent engineering logs

**Checkpoint**: User Stories 1 and 2 are fully integrated; technical screeners can inspect deep architectural proof and case studies.

---

## Phase 5: User Story 3 - Mobile-Optimized Frictionless Contact & Touch Experience (Priority: P3)

**Goal**: Provide a working contact form powered by Web3Forms with client-side async submission, 16px mobile inputs, inline feedback, and mailto fallback.

**Independent Test**: Navigate to the Contact section on mobile viewport (375px); tap inputs and verify no auto-zoom occurs; submit a test payload and verify instant UI success confirmation; simulate network failure and verify immediate mailto fallback.

### Implementation for User Story 3

- [ ] T024 [US3] Implement accessible contact form markup in `layouts/partials/contact-form.html` including Name, Email, Message, and hidden botcheck honeypot field per `specs/001-portfolio-showcase/contracts/contact-api-contract.md`
- [ ] T025 [US3] Enforce mobile input sizing and button tap ergonomics in `assets/css/extended/custom.css` (minimum 16px font size on inputs, 44x44px button dimensions, focus states)
- [ ] T026 [US3] Implement client-side asynchronous submission script in `layouts/partials/contact-form.html` posting JSON payload to `https://api.web3forms.com/submit`
- [ ] T027 [US3] Add real-time UI status messages in `layouts/partials/contact-form.html` (instant green success banner on HTTP 200, error banner on failure)
- [ ] T028 [US3] Implement progressive enhancement fallback in `layouts/partials/contact-form.html` with native `<form action="https://api.web3forms.com/submit" method="POST" target="_top">` and a persistent, styled `mailto:contact@saminyasir.dev` link rendered directly below the submit button
- [ ] T029 [US3] Mount contact form and FlyRank credentials partial into homepage in `layouts/index.html`

**Checkpoint**: User Stories 1, 2, and 3 are complete. Complete end-to-end portfolio core functionality is operational.

---

## Phase 6: User Story 4 - Social Sharing Presence & Privacy-Respecting Visitor Analytics (Priority: P4)

**Goal**: Deliver rich Open Graph & Twitter card previews across platforms (LinkedIn, Twitter/X, Slack, Discord), multi-resolution favicons, and non-blocking cookieless visitor telemetry via Cloudflare Web Analytics.

**Independent Test**: Validate via social preview scrapers (e.g., OpenGraph.xyz) that link previews render the high-contrast social card; verify favicon crispness in browser tabs and iOS home screen; confirm `beacon.min.js` loads asynchronously without blocking rendering or setting cookies.

### Implementation for User Story 4

- [ ] T030 [P] [US4] Create high-contrast Open Graph preview card image at `static/images/og-card.png` (1200x630px displaying Samin Yasir, Backend & Systems Engineer, and core domain)
- [ ] T031 [P] [US4] Create multi-resolution favicon suite in `static/favicon.svg` (modern vector tab icon), `static/favicon.ico` (multi-size 16x16/32x32), and `static/apple-touch-icon.png` (180x180 iOS shortcut)
- [ ] T032 [US4] Create custom head extension partial in `layouts/partials/extend_head.html` injecting Open Graph tags (`og:title`, `og:description`, `og:image`, `og:url`), Twitter cards (`twitter:card="summary_large_image"`, `twitter:image`), and favicon link elements
- [ ] T033 [US4] Create custom footer extension partial in `layouts/partials/extend_footer.html` injecting Cloudflare Web Analytics cookieless beacon script (`https://static.cloudflareinsights.com/beacon.min.js`) conditionally using `params.cloudflareAnalytics.token` with `defer` attribute

**Checkpoint**: User Story 4 complete. Rich social sharing unfurls and visitor telemetry are active without privacy/performance overhead.

---

## Phase 7: Polish & Cross-Cutting Concerns

**Purpose**: End-to-end verification, quality audit, and deployment readiness.

- [ ] T034 Run layout validation against `specs/001-portfolio-showcase/quickstart.md` (check reading measure constraint, 44x44px tap targets, 16px input font size)
- [ ] T035 Perform code block overflow test on mobile viewports ensuring `overflow-x: auto` functions properly without horizontal page blowout
- [ ] T036 Audit site content against anti-pattern gates in `constitution.md` (verify 0 animated skill percentage bars, 0 broken links, 0 tutorial clones)
- [ ] T037 Validate social card preview metadata and favicon loading using browser inspect tools and Open Graph verification
- [ ] T038 Verify static build generation and validate output assets

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: Can start immediately.
- **Foundational (Phase 2)**: Depends on Setup (Phase 1) — BLOCKS all user stories.
- **User Story 1 (Phase 3 - P1 MVP)**: Depends on Phase 2. Can be deployed independently as the initial MVP hero qualification.
- **User Story 2 (Phase 4 - P2)**: Depends on Phase 2. Can proceed after or alongside US1.
- **User Story 3 (Phase 5 - P3)**: Depends on Phase 2. Implements the dynamic contact layer and accreditations.
- **User Story 4 (Phase 6 - P4)**: Depends on Phase 2. Implements social preview metadata, favicons, and Cloudflare analytics.
- **Polish (Phase 7)**: Depends on completion of all user stories.

### Parallel Opportunities

- **Phase 1**: T004 (`.gitignore`) and T005 (`README.md`) can run in parallel.
- **Phase 2**: T009 (CSS code blocks), T010 (`data/credentials.yaml`), and T011 (SVG asset) can run in parallel.
- **Phase 4**: T017 (`data/projects.yaml`), T020 (`content/projects/social-media-studio.md`), T021 (`content/posts/...`), and T022 (`content/posts/...`) can run in parallel.
- **Phase 6**: T030 (`static/images/og-card.png`) and T031 (`static/favicon.*`) can be created in parallel.
- **Phases 3, 4, 5, 6**: Once Phase 2 completes, distinct content and layout modules can be developed in parallel across different files.

---

## Implementation Strategy

### MVP First (User Story 1 Only)
1. Complete Phase 1 (Setup) and Phase 2 (Foundational).
2. Complete Phase 3 (User Story 1 - Above-the-fold scan).
3. Validate User Story 1 against the 30-second scan criteria.

### Incremental Delivery
1. Foundation + US1 $\rightarrow$ Working identity and focus statement (MVP).
2. Add US2 $\rightarrow$ Structured project card architecture and Social Media Studio case study.
3. Add US3 $\rightarrow$ Working Web3Forms contact form, 16px mobile input guards, and FlyRank badge.
4. Add US4 $\rightarrow$ Open Graph social preview cards, multi-size favicons, and Cloudflare cookieless analytics.
5. Execute Phase 7 Polish and deploy to Cloudflare Pages.
