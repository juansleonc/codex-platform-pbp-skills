---
name: "pbp-review-finding-validator"
description: "Use for validating PBP platform PR review comments, bot findings, suspected regressions, or risk claims before deciding whether to fix, reject, or defer them."
---

# PBP Review Finding Validator

Use this skill when a review comment, bot finding, or risk claim may be actionable but is not yet proven.

## Goal

Classify each finding as one of:

- `Confirmed bug`: evidence shows current behavior is wrong or unsafe.
- `False positive`: evidence shows the claimed issue does not occur.
- `Deferred debt`: issue is real but outside the requested scope or not a regression.
- `Needs more evidence`: local context cannot prove or falsify it yet.

## Workflow

1. Quote or summarize the finding as a testable claim.
2. Identify the touched contract: behavior, authorization, tenant scope, API response, persistence, performance, migration safety, or external boundary.
3. Inspect the implementation and nearby specs.
4. Reproduce or falsify with the narrowest local proof available.
5. If confirmed, make the smallest fix and add focused regression coverage.
6. If not confirmed, document why without adding weak tests.

## Evidence Standards

- Prefer executable proof: focused spec, request, GraphQL query, console reproduction, or browser evidence.
- Use code reasoning only when the claim is structurally impossible or the failure is visible at compile/load time.
- For authorization and tenant-scope claims, prove both allowed and denied/scoped behavior when feasible.
- For performance claims, look for actual query shape, N+1 risk, missing preload, or missing index evidence.
- For migration claims, verify DDL safety and rollback implications before editing.

## Fix Rules

- Do not broaden behavior to satisfy a speculative finding.
- Do not refactor unrelated code while addressing a review finding.
- Avoid adding tests that only assert the current implementation shape.
- When the finding is false positive or deferred debt, leave a concise evidence trail.

## Output

Lead with findings and classifications:

```text
Finding: <short claim>
Classification: Confirmed bug | False positive | Deferred debt | Needs more evidence
Evidence: <spec/log/code path/browser proof>
Action: <fix made, no change, or follow-up needed>
```

Then report validation commands and any remaining risk.

