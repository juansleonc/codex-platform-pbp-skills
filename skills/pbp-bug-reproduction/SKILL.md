---
name: "pbp-bug-reproduction"
description: "Use when a PBP platform bug report, screenshot, review comment, bot finding, failing workflow, or suspected regression should be reproduced or falsified before editing."
---

# PBP Bug Reproduction

Use this skill before editing when the task describes an unproven bug or regression and the environment can reasonably reproduce it.

## Reproduction First

1. Restate the reported behavior as an observable claim.
2. Identify the narrowest reproduction surface: spec, Rails console, API request, GraphQL call, browser flow, logs, or database query.
3. Gather current code context with `rg` and nearby specs.
4. Capture failing evidence before changing implementation.
5. If the claim is false or not reproducible, document the evidence instead of adding low-value tests or broad refactors.

## Evidence Options

- Existing failing spec: run the focused spec and capture the failure.
- Missing spec path: write the smallest failing regression spec first when practical.
- API/GraphQL bug: reproduce with request spec, local request, or GraphQL spec.
- Browser bug: use the platform E2E evidence workflow; capture screenshots, current console/network evidence, and final state.
- Data-dependent bug: use local seed/test data first; use production data tools only when explicitly available and appropriate.
- Review/bot finding: classify as confirmed bug, false positive, deferred debt, or needs more evidence.

## Editing Rules

- Do not edit before reproduction unless the issue is a trivial typo, missing constant, or compile-time failure visible from code.
- Keep the fix scoped to the reproduced contract.
- Rerun the same proof after the fix.
- Add adjacent regression coverage only where it would catch recurrence.

## Validation Loop

1. Capture failing proof.
2. Make narrow fix.
3. Rerun failing proof.
4. Run adjacent regression slice.
5. Record any gap or unresolved uncertainty.

## Output

Report:

- Original claim.
- Reproduction method and evidence.
- Fix summary if edited.
- Post-fix validation.
- Classification if no edit was made.

