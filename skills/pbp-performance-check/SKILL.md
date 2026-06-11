---
name: "pbp-performance-check"
description: "Use for PBP platform performance risks including N+1 queries, missing indexes, slow scopes, query plans, memory pressure, caching, GraphQL/API latency, or spec/runtime profiling."
---

# PBP Performance Check

Use this skill for performance-sensitive changes and suspected regressions.

## Start

1. Identify the hot path, data volume, and caller.
2. Inspect query shape, loops, preloads, scopes, serializers, and GraphQL fields.
3. Measure or reproduce before optimizing when feasible.
4. Prefer local profiling and focused specs first.

## Risk Patterns

- N+1 queries through serializers, GraphQL fields, presenters, or policy checks.
- Missing composite index for filtering plus sorting.
- Loading large relations into Ruby when SQL can do the work.
- Repeated count/sum/existence queries inside loops.
- Cache keys missing tenant, locale, or permission context.
- Background jobs materializing too many records at once.
- Specs slow because factories create hidden cascades.

## Investigation Tools

Use the narrowest available evidence:

- Focused spec/profile output.
- SQL logs and query count.
- `EXPLAIN` or index inspection for risky queries.
- FactoryProf/FactoryDoctor/EventProf when spec performance is the target.
- Browser/network timings when UI latency is the target.

RSpec profiling:

```bash
bundle exec env FPROF=1 rspec <path> --format progress --profile 20
```

## Fix Rules

- Prefer removing work over caching work.
- Add preloads only for the exact associations used.
- Add indexes that match real predicates and ordering.
- Batch large jobs and keep memory bounded.
- Keep cache invalidation explicit.
- Do not add broad refactors without measured benefit.

## Output

Report:

- Measured or reasoned bottleneck.
- Change made.
- Query/index/cache implications.
- Validation or profiling result.
- Residual performance risk.

