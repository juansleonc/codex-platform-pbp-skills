---
name: "claude-skill-porting"
description: "Use when converting Claude, Superpower, or other agent workflow files into Codex skills or plugins while preserving useful behavior and removing incompatible assumptions."
---

# Claude Skill Porting

Use this skill to adapt workflow instructions from Claude, Superpower, or other agent systems into Codex-compatible skills.

## Inputs

- Source skill or workflow files.
- Target scope: user-level skill, repo-level skill, or distributable plugin.
- Any repo-specific rules that must override the source workflow.

## Porting Steps

1. Identify the source workflow's actual trigger, inputs, outputs, tools, scripts, and safety assumptions.
2. Separate reusable workflow logic from model-specific or product-specific behavior.
3. Convert the result into Codex `SKILL.md` format with `name` and `description` front matter.
4. Make the `description` concise and trigger-oriented because Codex may shorten long skill lists.
5. Replace unavailable tools with Codex equivalents or mark them as explicit requirements.
6. Keep scripts and references in sibling folders under the skill directory when they are needed.
7. If the skill should be distributed, package it in a plugin with `.codex-plugin/plugin.json`.

## Compatibility Rules

- Do not copy proprietary or hidden model behavior claims.
- Do not assume Claude-only tools exist in Codex.
- Prefer Codex-native surfaces: `AGENTS.md` for repo conventions, skills for reusable workflows, plugins for distribution, MCP for external live data/actions, and hooks for lifecycle enforcement.
- Preserve user/team safety rules even when the source skill was looser.

## Output Checklist

- The skill has valid front matter.
- The trigger scope is clear.
- Tool requirements are explicit.
- Repo-specific overrides are documented.
- The skill is small enough to load only when useful.

