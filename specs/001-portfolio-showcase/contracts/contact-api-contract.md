# Web3Forms Contact API Contract

## Overview
The contact form on `saminyasir.dev` transmits inquiries directly to the inbox via Web3Forms client-side POST endpoint without requiring a server-side backend, with full progressive enhancement and fallback guarantees.

## Endpoint Specification

- **URL**: `https://api.web3forms.com/submit`
- **Method**: `POST`
- **Headers**:
  - `Content-Type: application/json` (or `multipart/form-data`)
  - `Accept: application/json`

## Request Contract

```json
{
  "access_key": "string (UUID format)",
  "name": "string (min 2, max 100 chars)",
  "email": "string (valid email address)",
  "message": "string (min 10, max 3000 chars)",
  "botcheck": ""
}
```

### Field Definitions

| Field | Type | Mandatory | Description |
| :--- | :--- | :--- | :--- |
| `access_key` | string | Yes | Unique public access token issued by Web3Forms for direct inbox routing. |
| `name` | string | Yes | Sender's full name. |
| `email` | string | Yes | Sender's return email address for replies. |
| `message` | string | Yes | Plain text inquiry message. |
| `botcheck` | string | Optional | Hidden anti-spam honeypot field. Must be empty. If filled, Web3Forms silently drops the spam submission. |

## Response Contract

### Success Response (`HTTP 200 OK`)

```json
{
  "success": true,
  "message": "Form submitted successfully"
}
```

**Client Behavior**:
- Form inputs locked.
- Green success banner displayed: "Message received. Samin will reply shortly."
- Form fields reset after 3 seconds.

### Failure Response (`HTTP 400 / 429 / 500` or Network Failure)

```json
{
  "success": false,
  "message": "Invalid email address or submission rate limited."
}
```

**Client Behavior**:
- Error banner displayed: "Submission failed. Please email directly at contact@saminyasir.dev."
- Form inputs remain populated so the user does not lose their typed message.
- A 1-click `mailto:contact@saminyasir.dev?subject=Portfolio%20Inquiry` link is immediately visible.

## Progressive Enhancement & Script-Blocked Fallback

To satisfy resilient software invariants when client-side JavaScript is disabled, fails, or when ad-blockers (such as uBlock Origin) intercept the API endpoint:

1. **Native Form Attributes**: The HTML form element is defined with:
   ```html
   <form id="contact-form" action="https://api.web3forms.com/submit" method="POST" target="_top">
     <input type="hidden" name="access_key" value="{{ .Site.Params.web3forms.access_key }}">
     <input type="checkbox" name="botcheck" class="hidden" style="display: none;">
     ...
   </form>
   ```
2. **Persistent Visible Fallback**: Immediately below the submit button, render a permanent direct email fallback link:
   ```html
   <div class="contact-fallback">
     <span>Or reach out directly: </span>
     <a href="mailto:contact@saminyasir.dev?subject=Portfolio%20Inquiry" class="contact-direct-link">contact@saminyasir.dev</a>
   </div>
   ```
3. **Graceful Enhancement**: When JavaScript is active, an event listener intercepts `submit` via `event.preventDefault()` to provide modern asynchronous submission and inline banner feedback. If the fetch promise rejects (e.g. ad-blocker blocked domain), the form displays an inline alert prompting the user to either submit via native POST or click the persistent email link.
