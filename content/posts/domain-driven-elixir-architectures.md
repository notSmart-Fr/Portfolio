---
title: "Where AI Fails in Domain-Driven Elixir Architectures"
date: 2026-10-08T00:00:00Z
summary: "Why generative code assistants struggle with OTP supervision hierarchies, process dictionary traps, and explicit boundary seams."
tags: ["Elixir", "OTP", "Domain-Driven Design", "Architecture"]
---

Generative LLMs excel at syntax and typical imperative programming idioms. However, when building resilient concurrent backends with Elixir and OTP, LLMs frequently introduce subtle architectural flaws.

## Common LLM Failures in OTP Systems

### 1. Treating GenServers as State Machines for Everything
LLMs frequently propose a single monolithic `GenServer` to manage business logic. In reality:
- GenServers should model **concurrency bottlenecks or state that outlives a request**, not standard functional domain logic.
- Pure Elixir modules (functional cores) should handle business logic; GenServers should act solely as thin process coordinators (imperative shells).

### 2. Violating OTP Supervision Hierarchies
When an unhandled crash occurs, OTP restarts the worker process according to its supervision strategy (`:one_for_all`, `:one_for_one`). AI models frequently wrap GenServer calls in catch-all `try/rescue` blocks, blinding the supervisor to catastrophic failures and causing zombie worker states.

## The Resilient Pattern: Functional Core, Process Shell

By isolating pure functions and relying on "Let it Crash" principles with Oban or OTP supervisors, systems achieve self-healing properties that imperative code cannot match.

