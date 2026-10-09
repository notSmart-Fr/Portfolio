# Samin Yasir - Backend & Systems Engineer Portfolio

> Portfolio source code for [saminyasir.dev](https://saminyasir.dev) built with Hugo Extended and PaperMod, hosted on Cloudflare Pages.

---

## Architecture Overview

- **Static Site Generator**: Hugo Extended (Go single binary, sub-50ms build time)
- **Base Theme**: PaperMod (customized layout partials & typographic styling)
- **Edge Hosting**: Cloudflare Pages (Global edge CDN, automated HTTP/3 & Brotli)
- **Contact Channel**: Web3Forms (progressive form fallback + persistent mailto)
- **Telemetry**: Cloudflare Web Analytics (cookieless beacon, 0ms render-blocking)
- **Accreditation**: FlyRank Certified Graduate Badge

---

## Local Development

### Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) (`v0.120.0+`)
- [Git](https://git-scm.com/) (`v2.40+`)

### Clone & Run

```bash
# Clone with submodules
git clone --recurse-submodules https://github.com/saminyasir/portfolio.git
cd portfolio

# Run development server with live reload
hugo server -D -p 1313
```

Visit `http://localhost:1313/` in your browser.

---

## Cloudflare Pages Deployment Configuration

To deploy `saminyasir.dev` on Cloudflare Pages:

1. **Framework Preset**: `Hugo`
2. **Build Command**: `hugo --gc --minify`
3. **Build Output Directory**: `public`
4. **Environment Variables**:
   - `HUGO_VERSION`: `0.125.0` (or latest stable extended release)
5. **Custom Domain**:
   - Add custom domain `saminyasir.dev` in the Cloudflare Pages dashboard.
   - SSL/TLS encryption mode: `Full (Strict)`.
6. **Web Analytics**:
   - Enable Cloudflare Web Analytics in project dashboard or configure `params.cloudflareAnalytics.token` in `config/_default/hugo.yaml`.

