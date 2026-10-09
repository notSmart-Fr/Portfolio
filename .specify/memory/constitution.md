<!--
Sync Impact Report
- Version change: 0.0.0 (Unratified Template) → 1.0.0
- List of modified principles:
  - [PRINCIPLE_1_NAME] → I. 30-Second Scannability & Instant Context
  - [PRINCIPLE_2_NAME] → II. Concrete Architectural Proof Over Tutorial Clones
  - [PRINCIPLE_3_NAME] → III. Structured Project Card Hierarchy (Signal Over Walls of Text)
  - [PRINCIPLE_4_NAME] → IV. Mobile Ergonomics & Strict Layout Constraints
  - [PRINCIPLE_5_NAME] → V. Functional Contact Channels & Verified Proof Points
- Added sections:
  - Visual Hierarchy & Reading Ergonomics Standards
  - Content Quality & Anti-Pattern Gates
- Removed sections:
  - Unused generic template slots
- Follow-up TODOs: None
-->

# saminyasir.dev Portfolio Constitution

## Core Principles

### I. 30-Second Scannability & Instant Context
The portfolio is an interface whose primary job is to communicate competence, remove friction, and direct attention. Recruiters and hiring managers spend 15 to 30 seconds scanning on their first visit. Within that window, the interface MUST unambiguously answer three questions:
1. *Who is this person, and what is their core domain?*
2. *Can they actually build resilient software, or are they just repeating tutorials?*
3. *Where is the proof, and how do I contact them?*

The "Above the Fold" scan MUST immediately establish identity and technical scope without vague aspirational filler copy.

### II. Concrete Architectural Proof Over Tutorial Clones
The portfolio MUST showcase engineering depth, architectural reasoning, trade-offs, and edge-case resilience rather than basic tutorial clones or subjective self-ratings (e.g. animated percentage skill bars). Every highlighted project MUST demonstrate:
- Architectural decisions and trade-offs.
- Edge-case resilience (e.g., HTTP 429 rate limits, partial batch failure recovery, worker restarts, idempotent delivery).
- Verifiable proof (e.g., test suites, ExUnit transcripts, reproducible test matrices, and public source repositories).

### III. Structured Project Card Hierarchy (Signal Over Walls of Text)
Project showcases MUST NEVER dump unstructured lists of tools or walls of prose. Project cards MUST follow a structured, multi-layer information architecture:
1. **Header**: Project Title, Year/Timeline, and Technology Stack badges.
2. **One-Sentence Outcome**: Direct statement of what the system achieves and its primary guarantee.
3. **Architectural Highlights**: Bulleted, concrete mechanics (e.g., Idempotency mechanisms, Fault Tolerance patterns).
4. **Actionable Links**: Direct access to deep-dive case studies, source repositories, and interactive/video demonstrations.

### IV. Mobile Ergonomics & Strict Layout Constraints
Reviewers frequently access links on mobile devices via email or social apps. The interface MUST enforce strict physical and typographical constraints:
- **Line Length (Reading Measure)**: Constrain long-form reading columns to 65–75 characters (`max-w-2xl` / ~680px) with comfortable line height (140%–160%). Body text MUST NOT stretch unconstrained across ultra-wide monitors.
- **Tap Targets**: All interactive controls, navigation links, and action buttons MUST provide minimum touch target dimensions of 44x44px.
- **Viewport Integrity**: Code blocks, terminal logs, and preformatted text MUST use `overflow-x: auto; white-space: pre;` to prevent breaking viewport margins or inducing horizontal page scroll.
- **Form Ergonomics**: Form inputs MUST render with a minimum font size of 16px on mobile viewports to prevent iOS Safari auto-zoom on focus.

### V. Functional Contact Channels & Verified Proof Points
Friction in establishing contact is unacceptable. Contact channels MUST be immediately accessible, reliable, and functional:
- A contact form that validates and reliably dispatches messages to the inbox on first attempt.
- Unbroken, verified external links (GitHub, LinkedIn, Email).
- Verifiable credentials and certifications (e.g., FlyRank Certified Graduate Badge).

## Visual Hierarchy & Reading Ergonomics Standards

The visual hierarchy for `saminyasir.dev` MUST adhere to explicit typographic scale and layout rules:
- **Level 1 (Title / Name)**: `Samin Yasir` (28–32px, bold, high contrast).
- **Level 2 (Role & Scope)**: `Backend & Systems Engineer` (18–20px, medium contrast).
- **Level 3 (Focus Statement)**: `Building resilient concurrent pipelines, adapter seams, and distributed event systems.` (15–16px, muted/secondary tone).
- **Reading Measure**: Max width constrained to `max-w-2xl` (~680px) with 1.4–1.6 line height.
- **Layout Architecture**:
  1. Hero Header: Name, Role, Focus Statement, Social Links.
  2. Featured Work: High-signal architectural cards (e.g., Social Media Studio).
  3. Engineering Logs: Deep dives into distributed systems, concurrency, and architecture.
  4. Working Contact Form & Direct Email.
  5. Verified Accreditations & Badges.

## Content Quality & Anti-Pattern Gates

All content published to the portfolio MUST pass the following anti-pattern gates:
- **Prohibited**: Subjective skill rating bars or percentages (e.g., *"Elixir: 85%"*).
- **Prohibited**: Generic tutorial clones without original architecture (e.g., basic Todo apps, simple weather widgets, generic blogs).
- **Prohibited**: Vague competency claims without proof (e.g., *"familiar with REST APIs"*).
- **Prohibited**: Broken deep-links, dead demo URLs, or non-functional contact endpoints.
- **Mandatory**: Quantified, verified guarantees (e.g., *"100% duplicate suppression under retry storms"*, *"HTTP 429 Retry-After queue snoozing"*).

## Governance

This Constitution serves as the single source of truth for all design, architectural, and content decisions across `saminyasir.dev`.
- All design specifications, implementation plans, and UI pull requests MUST be validated against the principles defined herein.
- Any deviation or principle amendment requires explicit documentation, version incrementation, and recorded rationale.
- Semantic Versioning is strictly enforced:
  - **MAJOR**: Structural removals or fundamental redefinitions of core principles.
  - **MINOR**: Addition of new design/content standards or architectural constraints.
  - **PATCH**: Non-semantic clarifications, typo fixes, or wording enhancements.

**Version**: 1.0.0 | **Ratified**: 2026-10-09 | **Last Amended**: 2026-10-09
