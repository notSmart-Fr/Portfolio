---
title: "Enforcing Idempotent Delivery in Distributed Queues"
date: 2026-10-05T00:00:00Z
summary: "How partial unique indexing and transactional outboxes guarantee exactly-once message dispatch even during catastrophic worker crashes."
tags: ["Distributed Systems", "Elixir", "PostgreSQL", "Architecture"]
---

In distributed architectures, message delivery is fundamentally **at-least-once**. Network partitions make it impossible for a producer to know whether an unacknowledged message was received or dropped.

## The Pitfall of In-Memory Deduplication

A common anti-pattern is relying on cache-based deduplication keys in Redis with TTLs:
1. Worker receives job.
2. Checks Redis `SETNX job_id:timestamp`.
3. Dispatches HTTP request.
4. If the worker node experiences an OOM crash before persisting the result, the job restarts. If the TTL expired, a duplicate occurs.

## The Database Constraint Solution

By leveraging relational database invariants, idempotency moves from an application-level best effort to a durable database constraint:

```sql
CREATE TABLE dispatches (
    id UUID PRIMARY KEY,
    idempotency_key VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Partial unique constraint active only during in-flight and completed states
CREATE UNIQUE INDEX idx_dispatches_active_key 
ON dispatches(idempotency_key) 
WHERE status IN ('processing', 'completed');
```

When coupled with transactional job insertion (Transactional Outbox Pattern), duplicate worker execution fails safely at the persistence boundary.

