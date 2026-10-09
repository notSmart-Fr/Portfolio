# Data Model: Samin Yasir Systems Portfolio Showcase

This document specifies the entities, schema definitions, content models, and validation rules for the Hugo-based static architecture.

## Entities & Schemas

### 1. Site Configuration (`hugo.yaml` / `config.yml`)

Represents global site metadata, author identity, typography, social links, Open Graph parameters, and telemetry settings.

```yaml
baseURL: "https://saminyasir.dev/"
languageCode: "en-us"
title: "Samin Yasir | Backend & Systems Engineer"
theme: "PaperMod"

params:
  env: "production"
  title: "Samin Yasir"
  description: "Backend & Systems Engineer specializing in concurrent architectures and resilient publishing systems."
  author: "Samin Yasir"
  
  # Profile Mode (Above-the-fold scan)
  profileMode:
    enabled: true
    title: "Samin Yasir"
    subtitle: "Backend & Systems Engineer\nBuilding resilient concurrent pipelines, adapter seams, and distributed event systems."
    imageUrl: "" # Optional avatar
    buttons:
      - name: "Featured Work"
        url: "#featured-work"
      - name: "Contact"
        url: "#contact"
        
  # Social Links
  socialIcons:
    - name: "github"
      url: "https://github.com/saminyasir"
    - name: "linkedin"
      url: "https://linkedin.com/in/saminyasir"
    - name: "email"
      url: "mailto:contact@saminyasir.dev"

  # Social Open Graph & Twitter Cards
  socialMeta:
    image: "/images/og-card.png" # 1200x630 high contrast card
    imageAlt: "Samin Yasir - Backend & Systems Engineer Portfolio"
    twitterCard: "summary_large_image"
    twitterCreator: "@saminyasir"

  # Cloudflare Web Analytics (Cookieless)
  cloudflareAnalytics:
    token: "CLOUDFLARE_ANALYTICS_BEACON_TOKEN" # Optional token injection

  # Form Configuration
  web3forms:
    access_key: "ENV_OR_PUBLIC_ACCESS_KEY"
```

### 2. Social Metadata & Favicon Assets (`static/`)

Represents static branding, social preview images, and multi-resolution favicon files.

- `static/images/og-card.png`: 1200x630px PNG social banner (Title, Role, Core Domain, High Contrast).
- `static/favicon.svg`: Scalable vector icon for modern browser tabs in light/dark themes.
- `static/favicon.ico`: 32x32 / 16x16 multi-size legacy favicon.
- `static/apple-touch-icon.png`: 180x180px PNG for iOS bookmarks and home screen shortcuts.

### 3. Project Showcase (`content/projects/*.md` or `data/projects.yaml`)

Represents a featured engineering project adhering to the structured card architecture.

```yaml
# Data Schema for a Featured Project
id: "social-media-studio"
title: "Social Media Studio"
timeline: "Oct 2026"
weight: 1
featured: true

stack:
  - "Elixir"
  - "Oban"
  - "PostgreSQL"
  - "Docker"
  - "Telegram Bot API"

outcome: "An adapter-driven publishing engine with review gates and verified exactly-once delivery guarantees."

highlights:
  - title: "Idempotency"
    description: "PostgreSQL partial unique index suppressing duplicate dispatches under simulated network drops."
  - title: "Fault Tolerance"
    description: "Oban workers resuming mid-batch crashes with HTTP 429 snooze parsing."

metrics:
  - "100% duplicate suppression under retry storms"
  - "HTTP 429 Retry-After queue snoozing"

links:
  case_study: "/projects/social-media-studio/"
  github: "https://github.com/saminyasir/socialmedia-studio"
  demo_video: "https://youtu.be/..." # optional
```

**Validation Rules**:
- `title`: String, required, 3–60 characters.
- `outcome`: String, required, single concise sentence (max 150 characters).
- `highlights`: Array of at least 2 structured architectural points.
- `stack`: Array of 2–6 technology tags.
- `links.case_study` or `links.github`: At least one active, valid URL must be provided.

### 4. Engineering Log Entry (`content/posts/*.md`)

Represents an in-depth systems write-up or engineering log.

```yaml
title: "Enforcing Idempotent Delivery in Distributed Queues"
date: 2026-10-01T00:00:00Z
draft: false
tags:
  - "Distributed Systems"
  - "Elixir"
  - "PostgreSQL"
summary: "How partial unique indexing and transactional outboxes guarantee exactly-once message dispatch even during catastrophic worker crashes."
```

**Validation Rules**:
- `title`: String, required, descriptive, no clickbait.
- `summary`: String, required, 100–200 characters.
- `tags`: Array of technical domain strings.

### 5. Contact Submission Payload (Web3Forms Contract)

Represents client-side payload sent to Web3Forms API.

```json
{
  "access_key": "YOUR_ACCESS_KEY_HERE",
  "name": "Jane Doe",
  "email": "jane@example.com",
  "message": "Hi Samin, we'd like to discuss a systems engineering role...",
  "botcheck": "" 
}
```

**Validation Rules**:
- `name`: String, required, min 2 characters, max 100 characters.
- `email`: String, required, valid RFC 5322 email regex.
- `message`: String, required, min 10 characters, max 3000 characters.
- `botcheck`: Honeypot input, must be empty string (fails if filled by spam bot).

### 6. Accreditations & Credentials (`data/credentials.yaml`)

Represents verified certifications and badges.

```yaml
credentials:
  - id: "flyrank-cert"
    title: "FlyRank Certified Graduate"
    badge_image: "/images/flyrank-badge.svg"
    verification_url: "https://flyrank.com/verify/YOUR_ID"
    target: "_blank"
    rel: "noopener noreferrer"
    issued_date: "2026"
```

**Validation Rules**:
- `verification_url`: Required absolute URL pointing to `https://flyrank.com/verify/...`.
- `target`: MUST be `_blank` to open in new tab.
- `rel`: MUST be `noopener noreferrer` to prevent window.opener security leakage.

