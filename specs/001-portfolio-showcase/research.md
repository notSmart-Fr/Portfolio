# Phase 0 Research: Samin Yasir Systems Portfolio Technical Stack

## Technology Stack Decisions

### 1. Static Site Generator: Hugo (Extended)
- **Decision**: Hugo (`hugo-extended` or standard Hugo static binary).
- **Rationale**:
  - Blazing fast compilation (~50ms typical build time).
  - Single binary with zero runtime dependencies or Node.js runtime baggage.
  - Generates purely static HTML/CSS/JS, eliminating client-side hydration delays or large JavaScript bundle payloads.
  - First-class support for Markdown, structured frontmatter, code highlighting, and layout templates.
- **Alternatives Considered**:
  - *Next.js / Astro*: Requires Node.js build pipeline, npm dependency trees, and potential client-side JavaScript overhead that can hurt instant mobile load times.
  - *Zola*: Fast binary in Rust, but lacks the mature ecosystem and specific theme features provided by PaperMod.

### 2. Base Theme: PaperMod
- **Decision**: PaperMod with tailored typographic and layout overrides.
- **Rationale**:
  - Minimalist, fast, and engineered specifically for technical reading and code documentation.
  - Native dark/light mode toggle with zero flicker.
  - Clean semantic HTML structure out of the box.
  - Flexible layout partials allowing strict adherence to the constitution (e.g. `max-w-2xl` reading width, 44x44px touch targets, structured project card layouts).
- **Constitution Alignment**:
  - Overrides needed: Custom CSS to strictly lock reading columns to 65–75 characters (~680px), enforce 44x44px minimum tap targets, format preformatted code blocks with `overflow-x: auto; white-space: pre;`, and ensure 16px mobile input font sizes.

### 3. Edge Hosting & Deployment: Cloudflare Pages
- **Decision**: Cloudflare Pages connected to Git repository.
- **Rationale**:
  - Native zero-config Hugo build support (`HUGO_VERSION` environment variable).
  - Global edge CDN deployment with sub-50ms TTFB across worldwide edge nodes.
  - Automatic HTTPS, HTTP/3, and Brotli compression.
  - Direct integration with Cloudflare Registrar for custom domain `saminyasir.dev`.
- **Alternatives Considered**:
  - *GitHub Pages*: Lacks native worldwide edge worker intelligence and requires custom GitHub Actions workflows for advanced Hugo versions.
  - *Vercel / Netlify*: Great platforms, but Cloudflare Pages provides closer synergy with Cloudflare Registrar and zero-cost bandwidth.

### 4. Visitor Telemetry: Cloudflare Web Analytics
- **Decision**: Cloudflare Web Analytics cookieless beacon script (`beacon.min.js`).
- **Rationale**:
  - Privacy-first: Does not use client tracking cookies, does not track individual IP addresses, and does not require GDPR/ePrivacy cookie consent popups.
  - Zero-blocking performance: Loads asynchronously via a tiny JS beacon (`defer`) after the DOM has parsed.
  - Seamless integration: Enabled via Cloudflare Pages dashboard or by injecting a token-based script tag before `</body>`.
- **Alternatives Considered**:
  - *Google Analytics (GA4)*: Heavy client-side JavaScript bundle (>45KB), requires cookie consent banners, introduces third-party privacy tracking, slows down mobile first contentful paint.
  - *Plausible / Simple Analytics*: Privacy-friendly, but require paid subscriptions or external server maintenance.

### 5. Social Sharing Presence: Open Graph & Twitter Cards + Multi-resolution Favicons
- **Decision**: Custom Hugo meta partial implementing Open Graph (`og:*`), Twitter Cards (`summary_large_image`), and standard favicon suite.
- **Rationale**:
  - Guarantees rich link unfurls across LinkedIn, Twitter/X, Slack, Discord, and messaging apps.
  - PaperMod includes basic Open Graph tags, supplemented by a dedicated custom partial `layouts/partials/extend_head.html` to guarantee canonical absolute URLs (`https://saminyasir.dev/images/og-card.png`), crisp SVG favicons, standard `favicon.ico`, and `apple-touch-icon.png`.
- **Alternatives Considered**:
  - *Relying solely on default theme meta*: Default tags often omit `summary_large_image` or require hardcoded frontmatter params that fall back to broken relative paths on non-root routes.

### 6. Dynamic Form Delivery: Web3Forms
- **Decision**: Web3Forms client-side endpoint submission.
- **Rationale**:
  - Completely serverless form handling; posts standard JSON or `FormData` directly to `https://api.web3forms.com/submit`.
  - Delivers submissions straight to inbox without maintaining a dedicated backend server or serverless function.
  - Built-in honeypot spam protection and reCAPTCHA/hCaptcha support if needed.
  - Enables progressive enhancement: Works as a standard HTML `<form action="..." method="POST">` if JavaScript is disabled, or as an asynchronous `fetch()` handler with instant inline UI feedback and a mailto fallback.
- **Alternatives Considered**:
  - *Formspree*: Similar functionality, but lower free-tier submission quotas and more branding restrictions.
  - *Custom Cloudflare Worker*: Adds unnecessary code maintenance and secret storage for a static portfolio.

### 7. Domain Configuration: `saminyasir.dev` via Cloudflare Registrar
- **Decision**: Root apex and `www` CNAME routing through Cloudflare DNS with Full (Strict) SSL.
- **Rationale**:
  - Zero-latency DNS resolution directly on Cloudflare edge.
  - Seamless 1-click binding to Cloudflare Pages project.

## Verification of Constitution Compliance

| Constitution Principle | Stack Capability & Verification | Status |
| :--- | :--- | :--- |
| **I. 30-Second Scannability** | Pure static HTML generated by Hugo loads in <200ms; above-the-fold content rendered instantly with no blocking scripts. | **PASS** |
| **II. Concrete Architectural Proof** | PaperMod content collections support in-depth technical markdown, ExUnit code blocks, diagrams, and badge architectures. | **PASS** |
| **III. Structured Project Cards** | Custom Hugo partial `project-card.html` enforces Title, Badges, 1-Sentence Outcome, Architectural Highlights, and Action Links. | **PASS** |
| **IV. Mobile Ergonomics & Layout** | PaperMod layout supplemented with CSS overrides for 44px tap targets, 65–75 char measure, 16px mobile form inputs, and `overflow-x: auto` code blocks. | **PASS** |
| **V. Functional Contact Channel** | Web3Forms integrated asynchronously with inline validation, real-time success feedback, and automatic mailto fallback. | **PASS** |
| **Social Presence & Analytics** | Cookieless Cloudflare beacon adds 0ms render blocking; Open Graph and favicons provide crisp social cards across LinkedIn and Slack. | **PASS** |
