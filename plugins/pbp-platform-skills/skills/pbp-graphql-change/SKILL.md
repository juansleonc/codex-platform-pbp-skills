---
name: "pbp-graphql-change"
description: "Use for PBP platform GraphQL query, mutation, type, resolver, authorization, deferred query, or response contract changes with mobile compatibility risk."
---

# PBP GraphQL Change

Use this skill for GraphQL work in the PBP platform monolith.

## Start

1. Locate the query, mutation, type, resolver, policy, and caller specs with `rg`.
2. Check whether the field or mutation is used by mobile, whitelabel, admin, or public clients.
3. Treat response shape, nullability, enum values, authorization, and error format as contracts.
4. Prefer local focused validation. Do not use Blacksmith/Testbox unless explicitly requested.

## Compatibility Rules

- Do not remove or rename public fields without an explicit migration plan.
- Do not tighten nullability unless all callers and data states are proven safe.
- Keep enum additions backward-compatible; be careful with renames and removals.
- Preserve authorization behavior and tenant scoping.
- Keep deferred query behavior and loading paths explicit when touched.
- For mutations, verify success payload, validation errors, authorization errors, and side effects.

## Implementation Workflow

1. Reproduce the existing contract with a focused spec or query fixture when behavior is unclear.
2. Make the smallest schema/resolver/mutation change.
3. Add or update GraphQL specs for success, authorization, validation, and edge data states.
4. Check generated schema or type artifacts only if the repo expects them for the touched area.
5. Run the focused GraphQL spec and adjacent request/service specs when side effects cross layers.

## Validation

Typical commands:

```bash
bundle exec rspec spec/graphql/<path>
bundle exec rspec packs/<pack>/spec/graphql/<path>
```

Also run related service/model specs when a resolver delegates business behavior.

## Output

Report:

- Contract changed or preserved.
- Client/mobile compatibility risk.
- Authorization and tenant-scope coverage.
- Validation command and result.

