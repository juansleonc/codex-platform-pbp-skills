#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_dir="$repo_root/skills"
target_dir="$repo_root/plugins/pbp-platform-skills/skills"

mkdir -p "$target_dir"
rsync -a --delete "$source_dir/" "$target_dir/"

echo "Synced skills into plugins/pbp-platform-skills/skills"
