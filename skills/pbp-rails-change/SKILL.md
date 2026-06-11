---
name: "pbp-rails-change"
description: "Use for PBP platform Rails backend changes involving controllers, services, policies, query objects, models, workers, Packwerk boundaries, authorization, or local validation."
---

# PBP Rails Change

Use this skill for non-trivial backend changes in `/Users/leon/workspace/pbp/platform`.

## Start

1. Read the nearest `AGENTS.md` and any nested guidance for touched files.
2. Inspect the existing local pattern before choosing a design.
3. Check for related controllers, services, policies, queries, GraphQL types, workers, and specs with `rg`.
4. Preserve unrelated user changes in the worktree.
5. Prefer local validation. Do not use Blacksmith/Testbox unless the current user request explicitly asks for it.

## Architecture

- Keep controllers limited to HTTP concerns, authorization, and response formatting.
- Put reusable filtering, sorting, or lookup logic in existing query object patterns.
- Put orchestration in small services when the change spans multiple operations.
- Keep business rules in domain objects, policies, validators, or models that already own that behavior.
- Preserve Packwerk boundaries; do not create new cross-pack dependencies casually.
- Prefer explicit dependencies and local helpers over broad global state.

## Change Workflow

1. Reproduce or locate the behavior before editing when the request describes a bug, regression, screenshot, review finding, or bot comment.
2. Make the smallest implementation change that satisfies the observable contract.
3. Add or update focused specs at the layer that owns the behavior.
4. Run the narrowest relevant local validation first.
5. Broaden validation only when the touched behavior crosses contracts or shared boundaries.
6. Update docs only when behavior, setup, or durable workflow knowledge changes.

## Validation

Choose based on the touched surface:

- Model/service/policy: `bundle exec rspec <spec-path>`
- Request/controller/API: `bundle exec rspec <request-spec-path>`
- GraphQL: run the focused GraphQL spec and any caller contract spec.
- Pack boundary risk: `bundle exec packwerk check`
- Lint risk: `bundle exec rubocop <changed-files>`

For ad hoc profiling, use:

```bash
bundle exec env FPROF=1 rspec <path> --format progress --profile 20
```

## Output

When finishing, report:

- The behavior changed.
- The files touched.
- The validation run and result.
- Any remaining risk or validation not run.

