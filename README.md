# Codex Platform PBP Skills

Reusable Codex skills and plugins for the PBP platform codebase.

This repository has two layers:

- `skills/`: source skills that are easy to review, copy, or adapt.
- `plugins/pbp-platform-skills/`: installable Codex plugin packaging the skills for local use.

## Install as a Codex Marketplace

From any checkout, add this repo as a marketplace source:

```bash
codex plugin marketplace add /Users/leon/workspace/pbp/codex-platform-pbp-skills
```

Then restart Codex and install `pbp-platform-skills` from the plugin browser.

For a fresh machine, clone the repo first:

```bash
git clone git@github.com:juansleonc/codex-platform-pbp-skills.git
codex plugin marketplace add ./codex-platform-pbp-skills
```

## Authoring Rules

- Keep each skill focused on one workflow.
- Put every skill in its own directory with `SKILL.md`.
- Use concise `description` metadata because Codex may shorten long skill lists.
- Prefer instructions first; add scripts only for deterministic, repeatable work.
- Keep repo-specific rules aligned with `platform/AGENTS.md`.

After editing `skills/`, sync the plugin copy:

```bash
scripts/sync-plugin-skills.sh
```

## Layout

```text
.
├── .agents/plugins/marketplace.json
├── plugins/pbp-platform-skills/
│   ├── .codex-plugin/plugin.json
│   ├── scripts/
│   └── skills/
└── skills/
```
