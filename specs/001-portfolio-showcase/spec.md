# Feature Specification: Samin Yasir Systems Portfolio Showcase

**Feature Branch**: `001-portfolio-showcase`

**Created**: 2026-10-09

**Last Updated**: 2026-10-09

**Status**: Draft

**Input**: User description: "based on these i am going to make a portfolio" amended with "Analytics Script and Social Meta Preview & Favicon add this to the original spec not create new one", and clarified with form progressive degradation / fallback invariants and explicit FlyRank badge verification link specifications.

## Clarifications

### Session 2026-10-09
- Q: How must the contact form handle client environments where JavaScript is disabled or endpoint fetches are blocked by ad-blockers? → A: The form MUST implement progressive enhancement by specifying standard HTML `<form action="https://api.web3forms.com/submit" method="POST" target="_top">` attributes and render a persistent, directly visible `mailto:contact@saminyasir.dev` fallback link immediately below the submit button.
- Q: How must the FlyRank Certified Graduate badge be rendered and linked to satisfy accreditation grading criteria? → A: The badge in the footer/credentials section MUST be an active hyperlink (`<a>`) with `target="_blank"` and `rel="noopener noreferrer"` navigating directly to `https://flyrank.com/verify/YOUR_ID` (or candidate verification URL).

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Rapid 30-Second Technical Qualification (Priority: P1)

As a hiring manager or engineering recruiter scanning candidate links, I want to immediately identify Samin Yasir's identity, core engineering domain, and technical focus above the fold without marketing fluff, so that I can determine candidate relevance within 15 to 30 seconds.

**Why this priority**: Recruiters drop candidates if identity, domain, and proof points are not immediately evident in the initial viewport. This is the primary gatekeeper journey.

**Independent Test**: Can be validated by rendering the hero viewport on a standard 1080p desktop and mobile screen; an observer must be able to state the candidate's name, specialization, and core focus within 10 seconds of landing.

**Acceptance Scenarios**:

1. **Given** a visitor lands on `saminyasir.dev`, **When** the page loads, **Then** the viewport immediately displays:
   - Primary Title: "Samin Yasir" (prominent, high contrast)
   - Role & Scope: "Backend & Systems Engineer" (distinct secondary hierarchy)
   - Focus Statement: "Building resilient concurrent pipelines, adapter seams, and distributed event systems."
   - Direct links to GitHub, LinkedIn, and Email channels.
2. **Given** any screen resolution (mobile to ultra-wide), **When** reading the introductory content, **Then** the text column width does not exceed 75 characters (max width ~680px) and line height remains between 140% and 160%.
3. **Given** a visitor navigates to the footer credentials area, **When** clicking on the FlyRank Certified Graduate Badge, **Then** the link opens the official verification record at `https://flyrank.com/verify/YOUR_ID` in a new browser tab with `target="_blank"` and `rel="noopener noreferrer"`.

---

### User Story 2 - Deep Architectural Case Study Inspection (Priority: P2)

As an engineering lead or senior backend architect, I want to inspect concrete architectural proof, real-world failure handling, and trade-offs rather than generic tutorial projects, so that I can verify that Samin actually designs resilient concurrent systems.

**Why this priority**: Senior technical screeners require verifiable proof of edge-case handling (idempotency, retry storms, rate limiting) to separate senior systems engineers from junior candidates.

**Independent Test**: Can be tested by navigating directly to the "Featured Work" section; the reviewer can inspect the "Social Media Studio" project card and verify structured layers (outcome sentence, concrete architectural highlights, verified metrics, links to deep dive and repository).

**Acceptance Scenarios**:

1. **Given** an engineering lead visits the Featured Work section, **When** reviewing the "Social Media Studio" showcase, **Then** the card displays:
   - Stack tags indicating the technologies utilized (Elixir, Oban, PostgreSQL, Docker/Telegram Bot API).
   - A single-sentence outcome highlighting verified exactly-once delivery guarantees.
   - Distinct architectural bullets detailing idempotency mechanisms (PostgreSQL partial unique index under simulated network drops) and fault tolerance (Oban workers resuming mid-batch crashes with HTTP 429 snooze parsing).
   - Verifiable metric callouts (100% duplicate suppression under retry storms; HTTP 429 Retry-After queue snoozing).
2. **Given** a reviewer clicks on case study or source links, **When** redirected, **Then** the target destination opens the deep dive analysis or public repository containing code, test matrices, or ExUnit transcripts.

---

### User Story 3 - Mobile-Optimized Frictionless Contact & Touch Experience (Priority: P3)

As a recruiter reviewing candidate profiles on a mobile smartphone, I want to comfortably tap links, read technical details without broken layouts, and submit messages through a functional contact form without browser zoom disruptions or script-blocking failures, so that I can contact the candidate immediately.

**Why this priority**: A significant portion of recruiter traffic originates from mobile devices (LinkedIn apps, mobile email); touch friction, broken layouts, or form failure due to ad-blockers instantly kills response rates.

**Independent Test**: Can be tested on a mobile viewport (e.g., 375px width) with JavaScript enabled AND disabled by tapping interactive elements and submitting the contact form, verifying that all touch targets satisfy size criteria, form fields do not cause viewport zoom, and form submission or direct email is always available.

**Acceptance Scenarios**:

1. **Given** a visitor interacts with buttons, repo links, and navigation items on mobile, **When** tapping any target, **Then** all touch boundaries are at least 44x44px.
2. **Given** a visitor reads preformatted technical code blocks or logs, **When** viewing on narrow screens, **Then** the container scrolls horizontally without disrupting parent page margins or causing whole-page horizontal scrolling.
3. **Given** a visitor taps any contact form input field on iOS Safari or mobile browsers, **When** the input gains focus, **Then** the input text renders at 16px font size or larger, preventing automatic mobile viewport zooming.
4. **Given** a visitor completes and submits the contact form with JavaScript enabled and network operational, **When** clicking "Send Message", **Then** the message is dispatched to the inbox asynchronously and the user receives instant, unambiguous visual confirmation of delivery.
5. **Given** a visitor has JavaScript disabled or an ad-blocker blocking external API fetch endpoints, **When** interacting with the form, **Then** the form gracefully posts via native HTML form action (`action="https://api.web3forms.com/submit"` with `method="POST"` and `target="_top"`), while a persistent, styled `mailto:contact@saminyasir.dev` link remains visible immediately beneath the submit button.

---

### User Story 4 - Social Sharing Presence & Privacy-Respecting Visitor Analytics (Priority: P4)

As a recruiter, talent partner, or engineering lead sharing or bookmarking Samin's portfolio link on platforms like LinkedIn, X, Slack, or Discord, I want rich link previews and clean tab branding (favicon) to render immediately, while Samin receives privacy-first aggregated metrics on traffic sources without cookie consent banners or page slowdowns.

**Why this priority**: Links shared in hiring Slack channels or LinkedIn DMs with broken metadata or missing favicons look unpolished. Concurrently, tracking recruiter visits without violating privacy or degrading page performance confirms portfolio engagement.

**Independent Test**: Validate via Open Graph / social card preview tool and browser tab header; verify that shared URLs display a custom social preview card (title, description, domain preview image), tab displays high-resolution multi-size favicon, and a privacy-respecting analytics script executes non-blockingly without cookie banners.

**Acceptance Scenarios**:

1. **Given** a URL from `saminyasir.dev` is shared in chat or social platforms (e.g., LinkedIn, Slack, Twitter/X), **When** the platform crawls the link, **Then** a rich preview card renders showing:
   - Specific Open Graph and Twitter Card tags (`og:title`, `og:description`, `og:image`, `og:url`, `twitter:card`).
   - High-contrast visual summary preview image representing Samin Yasir's systems engineering focus.
2. **Given** a visitor opens any page of the portfolio, **When** the page loads in a browser tab or mobile bookmark, **Then** crisp favicon assets render correctly across all display densities (standard favicon, Apple Touch Icon, and SVG favicon).
3. **Given** a visitor navigates through the portfolio, **When** viewing pages, **Then** lightweight, privacy-respecting analytics (such as Cloudflare Web Analytics beacon) records page impressions asynchronously without loading third-party tracking cookies or prompting cookie consent modals.

---

### Edge Cases

- **Narrow viewport log overflow**: How does the system display wide ExUnit transcripts or terminal logs? Preformatted blocks must enforce horizontal auto-scrolling with preserved spacing and no parent container breakout.
- **Form submission failure / offline state / API blocking**: What happens if the backend contact endpoint experiences network downtime, JavaScript is disabled, or an ad-blocker (e.g. uBlock Origin) blocks the endpoint? The form MUST implement standard HTML form POST fallback (`target="_top"`) and feature a persistent, visible `mailto:contact@saminyasir.dev` link directly below the submit button.
- **Empty or invalid form fields**: What happens if invalid email formats or empty fields are submitted? Inline, accessible validation errors must display before submission without clearing user-entered draft text.
- **High latency / slow connection**: How does the portfolio behave on 3G mobile connections? Content and core typographic hierarchy must be fully readable immediately before any non-critical decorative assets finish loading.
- **Social crawler cache**: What happens when meta tags or preview images update? Open Graph assets must provide canonical absolute URLs with clear cache-busting or versioning tags.
- **Ad-blockers / Privacy extensions**: What happens if a visitor's browser blocks analytics scripts? The site layout and core user experience MUST NOT break or hang when analytics beacons are blocked or unavailable.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The system MUST render an above-the-fold hero section containing the candidate's full name, role title ("Backend & Systems Engineer"), concise domain focus statement, and persistent contact links.
- **FR-002**: The system MUST enforce a 3-level typographic hierarchy: Level 1 (28–32px bold title), Level 2 (18–20px medium role), and Level 3 (15–16px muted focus statement).
- **FR-003**: The system MUST constrain body reading measures to 65–75 characters per line (approx. max width 680px / `max-w-2xl`) with line height between 140% and 160%.
- **FR-004**: The system MUST present a "Featured Work" section organizing projects as structured cards featuring: Title, Timeline, Technology Badges, One-Sentence Outcome, Architectural Bullet Highlights, and Actionable Links (Deep Dive, Repository, Video).
- **FR-005**: Featured project highlights MUST explicitly communicate architectural trade-offs, edge-case resilience (e.g., HTTP 429 rate limit snoozing, mid-batch worker crash recovery), and verified metrics (e.g., duplicate suppression).
- **FR-006**: The system MUST present an "Engineering Logs" section showcasing deep-dive technical writings (e.g., idempotent delivery, domain-driven architectures).
- **FR-007**: The system MUST present a verified accreditations/credentials section in the footer including the FlyRank Certified Graduate badge, implemented as an active hyperlink with `target="_blank"` and `rel="noopener noreferrer"` navigating directly to `https://flyrank.com/verify/YOUR_ID`.
- **FR-008**: The system MUST provide an interactive contact form with fields for Name, Email, and Message, submitting to a working delivery channel with real-time success/error status feedback, native HTML POST fallback (`target="_top"`), and a persistent visible `mailto:contact@saminyasir.dev` fallback link below the submit button.
- **FR-009**: All interactive elements (buttons, links, form inputs) MUST have minimum tap/click target dimensions of 44x44px.
- **FR-010**: All preformatted code blocks and log transcripts MUST use horizontal auto-overflow (`overflow-x: auto`) and retain formatted whitespace without triggering horizontal viewport overflow.
- **FR-011**: All form inputs MUST specify a minimum font size of 16px on mobile viewports to prevent mobile browser auto-zooming.
- **FR-012**: The portfolio MUST strictly exclude anti-pattern elements: no arbitrary percentage skill bars (e.g., "Elixir 85%"), no generic tutorial clones, and no ungrounded claims lacking verifiable artifacts.
- **FR-013**: The system MUST include complete social meta preview tags (Open Graph `og:title`, `og:description`, `og:image`, `og:url` and Twitter `twitter:card="summary_large_image"`, `twitter:image`) pointing to high-resolution branding assets.
- **FR-014**: The system MUST provide multi-resolution favicon assets (standard favicon.ico/png, SVG vector icon, and Apple Touch Icon) linked in document head.
- **FR-015**: The system MUST embed a lightweight, privacy-friendly analytics beacon (e.g., Cloudflare Web Analytics beacon) that operates cookieless and executes asynchronously without impeding critical render path.

### Key Entities

- **Profile Profile**: Represents Samin Yasir's public professional identity, containing Name, Role, Technical Focus Statement, Verified Credentials, and Social/Direct Contact URLs.
- **Project Showcase**: Represents an in-depth systems project (e.g., Social Media Studio), containing Title, Timeline, Technology Badges, Outcome Summary, Architectural Highlights, Metric Proof Points, and External Links (Code Repository, Deep Dive Case Study, Demo).
- **Engineering Log Entry**: Represents an architectural article or post, containing Title, Summary, Publication Date, Topic Tags, and Reading Link.
- **Inquiry Submission**: Represents a contact message submitted by a visitor, containing Sender Name, Sender Email, Message Body, Timestamp, and Delivery Status.
- **Accreditation Credential**: Represents verified certifications including the FlyRank Certified Graduate Badge, including badge image asset, title, and external verification link URL (`https://flyrank.com/verify/YOUR_ID`).
- **Social Metadata Asset**: Represents social preview card assets, including Open Graph image asset (`og-image.png`), favicon files (`favicon.svg`, `favicon.ico`, `apple-touch-icon.png`), canonical URL, and summary copy.
- **Analytics Configuration**: Represents site telemetry parameters (e.g., Cloudflare Web Analytics token) configured cookieless to record page impressions and referral sources.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Reviewers can identify the engineer's identity, core domain, and proof points in under 15 seconds of landing on the site.
- **SC-002**: 100% of interactive clickable and tappable elements meet or exceed the 44x44px touch target guideline across all device viewports.
- **SC-003**: 0% horizontal page scrolling or layout shift caused by code blocks, tables, or terminal transcripts across viewport widths from 320px to 3840px.
- **SC-004**: Contact inquiries successfully deliver to the recipient inbox on the first attempt with 100% reliable feedback shown to the user in under 3 seconds, or can be dispatched via 1-click fallback `mailto:` link if JavaScript/endpoints are blocked.
- **SC-005**: Long-form body reading columns strictly maintain a measure between 65 and 75 characters per line across desktop viewports.
- **SC-006**: 100% elimination of banned anti-patterns (0 skill percentage bars, 0 broken external links, 0 tutorial clones without architectural additions).
- **SC-007**: 100% of major social preview crawlers (LinkedIn, Twitter/X, Slack, Discord) generate valid, high-contrast rich preview cards displaying title, description, and preview image without warnings.
- **SC-008**: Favicon renders crisp across standard and retina browser tabs and mobile bookmarking shortcuts.
- **SC-009**: Analytics script execution adds 0 blocking milliseconds to the first contentful paint (FCP) and triggers 0 cookie consent banners.
- **SC-010**: Clicking the FlyRank Certified Graduate Badge navigates directly to the external verification URL (`https://flyrank.com/verify/YOUR_ID`) in a new tab without security or referrer leakage.

## Assumptions

- Target audience consists of engineering recruiters, talent partners, and senior backend/systems hiring managers evaluating candidate portfolios.
- The portfolio is deployed as a high-performance web interface accessible across desktop, tablet, and mobile platforms.
- Contact form submissions route via a reliable backend email delivery provider or API webhook with resilient error handling and mailto fallback.
- Case study deep dives and public GitHub repositories referenced in project cards contain verifiable test suites and architectural documentation.
- Cloudflare Pages / Cloudflare Web Analytics is used for non-intrusive, cookieless traffic analytics.
- Social preview images and favicon assets are stored statically within the repository and served via the global edge CDN.
