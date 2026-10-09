# Quickstart & Verification Guide: Samin Yasir Systems Portfolio

This guide outlines prerequisites, local development commands, and verification checks for running and validating the portfolio locally and on Cloudflare Pages.

## Prerequisites

1. **Hugo Extended**: Version 0.120.0 or higher.
   - Verify: `hugo version`
2. **Git**: Version 2.40+ (with submodule support for PaperMod).
3. **Web3Forms Key**: A public access key obtained from `https://web3forms.com/` (free tier).
4. **Cloudflare Account**: For Cloudflare Pages deployment, Registrar DNS, and Web Analytics token.

## Setup & Local Development

### 1. Initialize Hugo Site & Theme
```bash
# In the portfolio repository
git init
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
```

### 2. Run Local Development Server
```bash
# Start server with draft posts and live reload enabled
hugo server -D -p 1313
```
- Open `http://localhost:1313/` in your browser.

## Verification Checklist

### 1. The 30-Second Above-the-Fold Test
- [ ] **Level 1 (Title)**: `Samin Yasir` is rendered at 28–32px bold with high contrast.
- [ ] **Level 2 (Role)**: `Backend & Systems Engineer` is rendered at 18–20px medium contrast.
- [ ] **Level 3 (Focus Statement)**: `Building resilient concurrent pipelines, adapter seams, and distributed event systems.` is displayed cleanly below.
- [ ] **Social Links**: GitHub, LinkedIn, and direct Email links are visible and operational.

### 2. Reading Measure & Layout Ergonomics
- [ ] **Reading Column Width**: Inspect the main content column width on a 1920x1080 monitor. Verify it is constrained to max `680px` (`max-w-2xl`) and 65–75 characters per line.
- [ ] **Line Height**: Body paragraph line height is between `1.4` and `1.6`.

### 3. Project Card Architecture
- [ ] **Social Media Studio Card**:
  - Displays tags: `Elixir`, `Oban`, `PostgreSQL`, `Docker`.
  - Displays 1-sentence outcome: "An adapter-driven publishing engine with review gates and verified exactly-once delivery guarantees."
  - Displays architectural bullets: Idempotency (PostgreSQL partial unique index) and Fault Tolerance (Oban workers with HTTP 429 snooze parsing).
  - Action buttons link to Deep Dive and GitHub Repo.

### 4. Mobile Responsiveness & Touch Ergonomics (Mobile Viewport: 375px width)
- [ ] **Tap Target Sizes**: Inspect button and link touch boxes using browser DevTools. All clickable elements are at least `44x44px`.
- [ ] **Code Blocks**: Long code snippets (e.g. ExUnit logs) have `overflow-x: auto; white-space: pre;` and do not cause horizontal page scroll.
- [ ] **Input Font Size**: Contact form input font size is `16px`, preventing mobile Safari auto-zoom on field focus.

### 5. Social Meta Preview & Favicon Suite
- [ ] **Open Graph Card**: Verify `<meta property="og:image" content="https://saminyasir.dev/images/og-card.png">` and `og:title`, `og:description` exist in `<head>`.
- [ ] **Twitter Card**: Verify `<meta name="twitter:card" content="summary_large_image">` exists.
- [ ] **Favicons**: Verify SVG vector icon, standard `favicon.ico`, and `apple-touch-icon.png` resolve with HTTP 200 and display crisply on high-DPI tabs.
- [ ] **Link Preview Test**: Test with social card debuggers (e.g., OpenGraph.xyz or Twitter Card validator) to confirm preview appearance.

### 6. Visitor Analytics (Cloudflare Web Analytics)
- [ ] **Beacon Script**: Inspect HTML source to verify `beacon.min.js` script tag loads with `defer` without blocking critical CSS/HTML.
- [ ] **Cookieless Check**: Verify application storage contains zero tracking cookies or consent modals.

### 7. Credentials & Accreditations (FlyRank Badge)
- [ ] **Active Hyperlink**: Verify the FlyRank Certified Graduate Badge in the footer is wrapped in an anchor `<a href="https://flyrank.com/verify/YOUR_ID" target="_blank" rel="noopener noreferrer">`.
- [ ] **Tab Isolation**: Clicking the badge opens the official verification URL in a separate browser tab without leaking window references.

### 8. Contact Form Delivery & Resilience (Web3Forms)
- [ ] **Online Submission**: Fill form with valid Name, Email, and Message. Submit and verify green success confirmation and inbox delivery.
- [ ] **Progressive Enhancement / No-JS Test**: Disable JavaScript in browser settings. Verify form has native `action="https://api.web3forms.com/submit"` and `target="_top"`. Submit and verify native browser POST.
- [ ] **Ad-Blocker / Endpoint Failure Fallback**: With JavaScript enabled, simulate endpoint rejection (or block `api.web3forms.com`). Verify inline error notification displays and the persistent `mailto:contact@saminyasir.dev` link remains clickable immediately below the submit button.

## Cloudflare Pages Deployment Configuration

- **Framework Preset**: `Hugo`
- **Build Command**: `hugo --gc --minify`
- **Build Output Directory**: `public`
- **Environment Variables**:
  - `HUGO_VERSION`: `0.125.0` (or latest stable extended version)
- **Custom Domain**:
  - In Cloudflare Pages dashboard: Connect custom domain `saminyasir.dev`.
  - SSL/TLS encryption mode: `Full (Strict)`.
- **Cloudflare Web Analytics**:
  - Enabled automatically in Pages Project settings, or inject beacon snippet into `layouts/partials/extend_footer.html`.
