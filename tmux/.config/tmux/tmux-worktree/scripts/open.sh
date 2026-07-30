#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$SCRIPT_DIR/common.sh"
source "$SCRIPT_DIR/session.sh"

path=$(
    fd . "$WORKTREES_DIR" \
        --type d \
        --min-depth 2 \
        --max-depth 2 |
    fzf --tmux 70% --prompt='worktree> ' --delimiter=/ --with-nth=-3..
)

[[ -z "$path" ]] && exit 0

repo=$(basename "$(dirname "$path")")
worktree=$(basename "$path")

launch_tmux_session \
    "$repo/$worktree" \
    "$path"
