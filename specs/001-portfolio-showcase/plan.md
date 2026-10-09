# Implementation Plan: Samin Yasir Systems Portfolio Showcase

**Branch**: `001-portfolio-showcase` | **Date**: 2026-10-09 | **Spec**: [specs/001-portfolio-showcase/spec.md](spec.md)

**Input**: Feature specification from `/specs/001-portfolio-showcase/spec.md` with Hugo + PaperMod + Cloudflare Pages + Web3Forms + saminyasir.dev via Cloudflare Registrar, updated to include Cloudflare Web Analytics, Open Graph & Twitter Cards, and multi-resolution favicons.

## Summary

Build and deploy a high-signal systems engineering portfolio for Samin Yasir (`saminyasir.dev`) using Hugo Extended and the PaperMod theme. The portfolio enforces a strict 30-second recruiter scan hierarchy, architectural project showcases (featuring the Social Media Studio case study), mobile touch ergonomics (44x44px tap targets, 65–75 character reading measures, 16px mobile form inputs), serverless inbox messaging via Web3Forms, rich Open Graph & Twitter Card social sharing previews, multi-resolution crisp favicons, and privacy-first cookieless visitor telemetry via Cloudflare Web Analytics.

## Technical Context

**Language/Version**: Go / Hugo Extended (v0.120+ binary), HTML5 / CSS3 / Vanilla JS (no heavy framework overhead)

**Primary Dependencies**: Hugo Theme PaperMod (Git submodule), Web3Forms API endpoint, Cloudflare Web Analytics beacon script (`beacon.min.js`)

**Storage**: Static Git repository files; content organized in Markdown (`content/projects/`, `content/posts/`) and structured YAML data (`data/projects.yaml`, `data/credentials.yaml`)

**Testing**: Visual regression & accessibility audit (DevTools), form contract submission test, social preview card debugger (OpenGraph.xyz), Cloudflare Pages preview builds

**Target Platform**: Cloudflare Pages Edge CDN (Global HTTP/3 + Brotli delivery), modern desktop and mobile web browsers

**Project Type**: High-performance static web application / documentation showcase

**Performance Goals**: Build time < 100ms; Time to First Byte (TTFB) < 50ms; Lighthouse 100 on Performance, Accessibility, and Best Practices; < 200ms initial page load; 0ms render-blocking time from telemetry beacons

**Constraints**: Max content column width 65–75 characters (~680px / `max-w-2xl`); 44x44px minimum tap target sizes; `overflow-x: auto` on code snippets; 16px mobile form input font size; zero skill percentage rating bars; cookieless analytics with zero cookie consent popups

**Scale/Scope**: Single-page primary hub (Hero, Featured Work, Engineering Logs, Contact Form, FlyRank Badge) + dedicated deep-dive case study routes + Open Graph metadata and favicon assets

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

| Principle / Gate | Compliance Requirement | Evaluation | Status |
| :--- | :--- | :--- | :--- |
| **I. 30-Second Scannability** | Instant Level 1–3 hierarchy above the fold without vague copy. | PaperMod profileMode configured with exact Title, Role, and Focus Statement. | **PASS** |
| **II. Concrete Architectural Proof** | Showcase real-world edge cases (HTTP 429, idempotency, failure recovery) over tutorial clones. | Social Media Studio project card explicitly covers Oban worker recovery & PostgreSQL idempotency. | **PASS** |
| **III. Structured Project Card Hierarchy** | Multi-layer layout: Header $\rightarrow$ 1-Sentence Outcome $\rightarrow$ Architectural Highlights $\rightarrow$ Deep Dive Links. | Implemented via custom Hugo partial `layouts/partials/project-card.html`. | **PASS** |
| **IV. Mobile Ergonomics & Constraints** | 65–75 char measure, 44x44px tap targets, `overflow-x: auto` code blocks, 16px form inputs. | Custom CSS styles in `assets/css/extended/custom.css` enforce exact specifications. | **PASS** |
| **V. Functional Contact Channels** | Working form delivering straight to inbox on first try with progressive fallback; active verified badge. | Web3Forms client-side integration with asynchronous fetch, native `<form action>` POST fallback (`target="_top"`), persistent visible `mailto:` link, and FlyRank badge linking to `https://flyrank.com/verify/YOUR_ID` with `target="_blank"`. | **PASS** |
| **Social Presence & Analytics** | Rich link previews without layout breakage; cookieless non-blocking telemetry. | Custom `extend_head.html` and `extend_footer.html` partials inject Open Graph tags, favicons, and Cloudflare beacon. | **PASS** |
| **Prohibited Anti-Patterns** | 0 skill progress bars, 0 ungrounded claims, 0 broken links. | Complete omission of animated skill bars; all claims tied to verifiable repos and test transcripts. | **PASS** |

## Project Structure

### Documentation (this feature)

```text
specs/001-portfolio-showcase/
├── spec.md              # Feature specification (includes US1-US4)
├── plan.md              # Implementation Plan (/speckit-plan output)
├── research.md          # Phase 0 research & stack decisions
├── data-model.md        # Phase 1 data schema & content models
├── quickstart.md        # Phase 1 validation & setup guide
├── contracts/           # Phase 1 API/UI contracts
│   └── contact-api-contract.md
└── checklists/
    └── requirements.md  # Spec quality checklist
```

### Source Code (repository root layout)

```text
Portfolio/
├── archetypes/
│   └── default.md
├── assets/
│   └── css/
│       └── extended/
│           └── custom.css       # Typography, 44px tap targets, 680px measure, code overflow
├── config/_default/
│   └── hugo.yaml                # Site config, profileMode, social links, OpenGraph, analytics
├── content/
│   ├── _index.md                # Homepage landing copy & section mounts
│   ├── projects/
│   │   ├── _index.md
│   │   └── social-media-studio.md # Architectural Deep Dive
│   └── posts/
│       ├── _index.md
│       ├── enforcing-idempotent-delivery.md
│       └── domain-driven-elixir-architectures.md
├── data/
│   ├── projects.yaml            # Structured project card data (Social Media Studio)
│   └── credentials.yaml         # FlyRank Certified Graduate Badge metadata
├── layouts/
│   ├── index.html               # Custom homepage layout composing hero, work, logs, contact
│   └── partials/
│       ├── extend_head.html     # Custom Open Graph, Twitter Cards & Favicon links
│       ├── extend_footer.html   # Cloudflare Web Analytics cookieless beacon snippet
│       ├── project-card.html    # Structured project card component
│       ├── contact-form.html    # Web3Forms form with 16px inputs & validation feedback
│       └── credentials.html     # FlyRank badge component
├── static/
│   ├── favicon.svg              # Modern vector tab icon
│   ├── favicon.ico              # Multi-size legacy favicon
│   ├── apple-touch-icon.png     # iOS bookmark shortcut icon
│   └── images/
│       ├── og-card.png          # 1200x630 Open Graph & Twitter preview banner
│       └── flyrank-badge.svg    # Verified certification badge asset
└── themes/
    └── PaperMod/                # Git submodule for base theme
```

**Structure Decision**: Standard idiomatic Hugo site structure with PaperMod theme submodule. Extends PaperMod cleanly using official extension partials (`extend_head.html` for Open Graph/favicons, `extend_footer.html` for Cloudflare analytics beacon) and layout overrides in `layouts/` and `assets/css/extended/custom.css`.

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

*No violations detected. Zero unnecessary dependencies or complexity introduced.*
