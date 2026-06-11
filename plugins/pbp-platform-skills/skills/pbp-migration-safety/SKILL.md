---
name: "pbp-migration-safety"
description: "Use for PBP platform database migrations, MySQL DDL, indexes, backfills, rollback safety, INSTANT requirements, locking risk, or data migration planning."
---

# PBP Migration Safety

Use this skill for schema and data migration work in the PBP platform monolith.

## Start

1. Identify the database engine behavior and table size/risk before editing.
2. Inspect existing migrations for local patterns and helpers.
3. Check model, query, and index usage with `rg`.
4. Prefer local validation. Do not run production-impacting DDL or data scripts.

## Safety Rules

- Do not run an `ALTER` without `INSTANT`.
- If `INSTANT` is unavailable, stop and propose an online/maintenance-window-safe approach.
- Avoid table rewrites, long locks, and irreversible destructive changes.
- Make rollback capability explicit.
- Separate schema changes, backfills, and application behavior changes when that reduces deploy risk.
- Keep backfills idempotent, resumable, and bounded.
- Avoid callbacks and model code in migrations unless the repo has a safe established pattern.

## Planning Checklist

- What table and columns/indexes are touched?
- Is the migration additive, destructive, or data-moving?
- Can it run online with `INSTANT`?
- What happens on rollback?
- Does the app need dual-read, dual-write, or a feature flag?
- Are indexes ordered for the actual query predicates and sort?
- Does Packwerk or ownership imply the migration belongs in a pack?

## Validation

Use local checks appropriate to the change:

```bash
bundle exec rails db:migrate
bundle exec rails db:rollback STEP=1
bundle exec rspec <affected-specs>
```

For risky queries, inspect actual query shape and explain/index behavior before recommending the migration.

## Output

Report:

- DDL/data risk classification.
- `INSTANT` status or blocker.
- Rollback behavior.
- Validation run.
- Any required deployment sequencing.

