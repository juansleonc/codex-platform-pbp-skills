---
name: "pbp-e2e-evidence"
description: "Use for PBP platform browser-driven E2E validation, local UI reproduction, screenshots, console/network evidence, downloads, exports, or final verified browser state."
---

# PBP E2E Evidence

Use this skill for browser-driven validation in the PBP platform.

## Start

1. Use the real local URL named by the user when available.
2. Prefer `agent-browser` for E2E work.
3. Clear or scope console/network logs before the focused pass.
4. Capture screenshots for important state transitions, error states, and final verified state.
5. Do not switch to Blacksmith/Testbox for E2E unless explicitly requested.

## Evidence Requirements

For each important state, collect at least one concrete proof:

- Screenshot path.
- `agent-browser snapshot -i` evidence or visible page state.
- Current console output when UI errors are relevant.
- Network status when requests, downloads, exports, or API failures are relevant.
- Setup command or data mutation used to create the state.

Screenshots should be saved with absolute paths and reported in the final answer.

## Workflow

1. Establish local app/server state.
2. Navigate through the visible UI instead of relying only on direct DOM mutation.
3. Capture the failing state before edits when reproducing a bug.
4. Make the narrow fix.
5. Rerun the same browser proof and any adjacent regression path.
6. Report only current evidence, not stale logs from earlier passes.

## Fallbacks

- Use local Playwright scripts only when `agent-browser` lacks the needed capability.
- Use backend/API checks to pair browser proof with durable state when the UI writes data.
- Use the Codex in-app browser only when explicitly requested or when current-tab visual handoff matters.

## Output

Report:

- URL tested.
- Screenshots with absolute paths.
- Console/network findings.
- Final verified state.
- Any browser path not covered.

