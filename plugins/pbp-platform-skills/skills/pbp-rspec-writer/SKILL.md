---
name: "pbp-rspec-writer"
description: "Use when writing, repairing, or optimizing PBP platform RSpec specs with behavior-faithful assertions, meaningful non-happy paths, and efficient fixtures."
---

# PBP RSpec Writer

Use this skill for RSpec work in the PBP platform monolith.

## Start

1. Identify the behavior owner before choosing the spec layer.
2. Read nearby specs for local style, helpers, factories, shared examples, and setup patterns.
3. Map the relevant behavior paths before writing examples.
4. Prefer local focused validation. Do not use Blacksmith/Testbox unless explicitly requested.

## Behavior Map

Cover paths that matter for the contract:

- Success path.
- Error or invalid input path.
- Empty or no-op path when meaningful.
- Authorization or tenant-scope path when relevant.
- Time-boundary path when dates, reservations, memberships, or billing are involved.
- External-failure path when a service, gateway, queue, search index, or API boundary is involved.

Do not add broad setup for paths that return before downstream lookups. Invalid-auth request specs can use arbitrary ids when authentication stops execution.

## Fixture Rules

- Prefer `build`, `build_stubbed`, plain model instances, structs, or verifying doubles for pure predicates and formatting.
- Keep real persistence for SQL scopes, uniqueness validations, callbacks under test, request/GraphQL integration, lifecycle behavior, and destructive operations.
- Pass explicit parents into factories to avoid hidden cascades.
- Avoid `allow_any_instance_of`; stub the production boundary instead.
- Use `let_it_be` or `before_all` only for read-only graphs. Use `refind: true` or `reload: true` if app code mutates shared rows.
- Keep async, cache, OpenSearch, DynamoDB, screenshots, sleeps, and job inline behavior scoped to examples that actually assert those side effects.

## Assertion Rules

- Assert observable behavior, not implementation trivia.
- For negative paths, assert the absence of side effects when that is the risk.
- For API/GraphQL responses, assert status, key fields, errors, and contract-sensitive shape.
- For jobs/services, assert boundary calls and durable state changes.
- Avoid specs that would stay green if the bug returned.

## Validation

Run focused specs first:

```bash
bundle exec rspec <spec-path>
```

For performance investigation:

```bash
bundle exec env FPROF=1 rspec <path> --format progress --profile 20
```

If a full run reports many `before_all transaction has been already rollbacked` messages, treat it as contaminated until a clean focused reproduction or retry proves otherwise.

## Output

Report:

- Behavior paths covered.
- Fixture strategy chosen.
- Validation command and result.
- Any meaningful path intentionally left uncovered.

