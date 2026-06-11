---
name: "pbp-platform-defaults"
description: "Use when working in the PBP platform Rails monolith to apply local repo conventions, local-first validation, testing preferences, and Codex skill selection rules."
---

# PBP Platform Defaults

Use this skill when a task targets the PBP platform Rails monolith and no more specific platform skill already covers the work.

## Workflow

1. Read the nearest `AGENTS.md` and any task-relevant nested guidance before editing.
2. Prefer the local development environment for focused specs, scripts, lint checks, and exploratory commands.
3. Do not use Blacksmith/Testbox unless the user explicitly asks for Blacksmith, Testbox, CI parity, or remote validation in the current request.
4. Inspect existing patterns before adding abstractions.
5. Keep edits narrowly scoped to the behavior requested.
6. Preserve unrelated user changes in the git worktree.

## Rails Boundaries

- Keep controllers focused on HTTP concerns, authorization, and response formatting.
- Put reusable filtering and sorting in query objects when the local codebase already follows that pattern.
- Put orchestration in small services and domain rules in domain objects or policies.
- Preserve Packwerk boundaries and avoid cross-package coupling.

## Testing

- Use focused local specs first, for example `bundle exec rspec <path>`.
- For ad hoc profiling, prefer `bundle exec env FPROF=1 rspec <path> --format progress --profile 20`.
- Keep factory setup deterministic and as light as the behavior allows.
- Do not add broad coverage for a bug report until the issue is reproduced or falsified when feasible.

## E2E Evidence

For browser-driven work, use the repo E2E evidence workflow and capture screenshots, current console/network evidence, and final verified state.

