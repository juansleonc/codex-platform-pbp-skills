---
name: "pbp-sidekiq-worker"
description: "Use for PBP platform Sidekiq worker changes involving retries, idempotency, queues, serialization, async side effects, external calls, scheduling, or job specs."
---

# PBP Sidekiq Worker

Use this skill for background job and async workflow changes.

## Start

1. Identify queue, retry policy, arguments, side effects, and caller.
2. Inspect nearby worker patterns and specs.
3. Check whether the job is idempotent under retries and duplicate enqueue.
4. Prefer focused local worker/service specs.

## Safety Rules

- Job arguments must be JSON-serializable and stable.
- Reload records inside the job; handle missing/deleted records intentionally.
- Make external calls idempotent or guarded.
- Do not silently swallow failures that should retry or alert.
- Avoid unbounded loops and large in-memory batches.
- Keep tenant/facility context explicit when reloading records.
- Preserve observability for payment, export, integration, or user-visible side effects.

## Behavior Map

Cover relevant paths:

- Successful perform.
- Missing record or no-op path.
- Retryable external failure.
- Non-retryable validation or business failure.
- Duplicate job/idempotency path.
- Tenant-scope or authorization-sensitive path.
- Enqueue caller behavior when scheduling is part of the contract.

## Validation

Typical focused checks:

```bash
bundle exec rspec spec/workers/<worker>_spec.rb
bundle exec rspec packs/<pack>/spec/workers/<worker>_spec.rb
```

Use inline jobs only when the job execution itself is the behavior under test.

## Output

Report:

- Async contract changed.
- Idempotency and retry handling.
- Argument and tenant-scope safety.
- Validation command and result.
- Any operational follow-up.

