---
name: "codex-skill-review"
description: "Use when reviewing a Codex skill or plugin for trigger quality, safety, maintainability, tool assumptions, and installability before adding it to a marketplace."
---

# Codex Skill Review

Use this skill before installing, publishing, or copying a skill into a repo.

## Review Order

1. Check the `name` is stable, lower-case, and specific.
2. Check the `description` states when the skill should trigger and when it should not.
3. Confirm the instructions are imperative, task-oriented, and not just background explanation.
4. Verify any referenced scripts, assets, or references exist relative to the skill directory.
5. Identify unsafe tool assumptions, network assumptions, destructive commands, or credential handling risks.
6. Check that the skill does not duplicate a better existing skill.
7. If packaged in a plugin, validate `.codex-plugin/plugin.json` and marketplace metadata.

## Findings Format

Lead with concrete issues ordered by severity. Include file paths and exact sections where possible.

Use this severity model:

- `High`: unsafe behavior, invalid install structure, destructive default, or likely data exposure.
- `Medium`: unclear trigger, incompatible tool assumption, missing referenced file, or duplicate workflow.
- `Low`: wording, organization, or maintainability issue.

End with whether the skill is ready to install, needs edits, or should be rejected.

