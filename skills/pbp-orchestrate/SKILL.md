---
name: "pbp-orchestrate"
description: "Use to coordinate complex PBP platform work across multiple Codex skills, dependencies, investigation notes, implementation, validation, documentation, commits, and follow-up planning."
---

# PBP Orchestrate

Use this skill as the entry point for complex PBP platform tasks that require more than one focused workflow.

Examples:

- Multi-file backend feature.
- Bug fix that needs reproduction, implementation, specs, and review-finding validation.
- GraphQL/API change with authorization, tenant scope, and mobile compatibility risk.
- Migration plus app code plus backfill plan.
- Payment, membership, E2E, or Sidekiq work with multiple validation layers.
- Long task that should leave durable investigation notes for later.

## First Pass

1. Read the nearest `AGENTS.md` in the target repo.
2. Check existing investigation notes before starting new work.
3. Identify whether the user wants implementation, review, planning, or explanation.
4. Choose the smallest set of skills needed for the task.
5. Prefer local validation. Do not use Blacksmith/Testbox unless the current user request explicitly asks for it.
6. Preserve unrelated user changes in the worktree.

## Investigation Notes

Before substantial work, check for durable context:

```bash
find docs/investigation investigations -maxdepth 3 -type f 2>/dev/null | sort
```

If continuing an existing initiative, read the relevant file first.

If the task creates durable learning, update the appropriate investigation doc with:

- Goal.
- Current state.
- Decisions.
- Validation commands.
- Next-session resume prompt.
- Open questions or blockers.

## Skill Routing

Use focused skills rather than one broad workflow:

- General Rails backend: `pbp-rails-change`
- Specs: `pbp-rspec-writer`
- Unproven bug: `pbp-bug-reproduction`
- Review/bot finding: `pbp-review-finding-validator`
- GraphQL contract: `pbp-graphql-change`
- Migration or backfill: `pbp-migration-safety`
- Browser proof: `pbp-e2e-evidence`
- Payments: `pbp-payment-safety`
- Memberships: `pbp-membership-change`
- Tenant isolation: `pbp-multi-tenancy-check`
- Runtime/query/spec performance: `pbp-performance-check`
- Sidekiq jobs: `pbp-sidekiq-worker`
- Porting external skills: `claude-skill-porting`
- Reviewing skill quality: `codex-skill-review`

Use multiple skills only when each one owns a real risk in the task.

## Execution Model

1. Clarify the contract only if the missing answer cannot be safely inferred.
2. Gather code context with `rg`, `rg --files`, and focused file reads.
3. Reproduce or falsify bugs before editing when feasible.
4. Plan the work when the blast radius is non-trivial.
5. Make small, reviewable edits.
6. Validate in the narrowest useful slice first.
7. Broaden validation when shared contracts, migrations, payments, GraphQL, or tenant scope are touched.
8. Update investigation notes when the work should be resumed later.
9. Commit/push only when the user asked to persist the work or the current task clearly includes repository publication.

## Parallelism

Parallelize independent reads and checks:

- File discovery.
- Nearby spec reads.
- Pattern searches.
- Git state checks.
- Documentation reads.

Do not parallelize dependent edits, destructive commands, migrations, or commands that need ordered state.

## Quality Gates

Before finishing, verify:

- The requested behavior is actually handled.
- Relevant focused validation passed or the failure is reported.
- The plugin/skill repo is synced if skills changed.
- Investigation notes are updated if the work is part of a longer thread.
- Git status is known.
- Final answer includes commit hash when a commit was made.

## Output

Report concisely:

- What was changed or decided.
- Which skills/workflows were involved.
- Validation run and result.
- Commit/push status if applicable.
- Next concrete step if work remains.

