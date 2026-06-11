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

## Skills

- `pbp-platform-defaults`: baseline platform conventions.
- `pbp-rails-change`: backend Rails change workflow.
- `pbp-rspec-writer`: behavior-faithful RSpec workflow.
- `pbp-bug-reproduction`: reproduce or falsify suspected bugs before editing.
- `pbp-review-finding-validator`: classify and handle review or bot findings.
- `pbp-graphql-change`: GraphQL contract and compatibility workflow.
- `pbp-migration-safety`: MySQL migration, backfill, and DDL safety workflow.
- `pbp-e2e-evidence`: browser-driven evidence collection workflow.
- `pbp-payment-safety`: payment gateway and PCI-sensitive workflow.
- `pbp-membership-change`: membership lifecycle and billing workflow.
- `pbp-multi-tenancy-check`: tenant isolation and authorization-scope workflow.
- `pbp-performance-check`: N+1, index, profiling, and runtime performance workflow.
- `pbp-sidekiq-worker`: Sidekiq idempotency, retry, and async safety workflow.
- `claude-skill-porting`: port Claude/Superpower workflows into Codex skills.
- `codex-skill-review`: review skill quality and installability.

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

## Investigation Notes

Ongoing planning and resume context live in:

- `docs/investigation/codex-platform-skills-roadmap.md`
