#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$SCRIPT_DIR/common.sh"
source "$SCRIPT_DIR/session.sh"

repo=$(select_repo) || exit 0
repo_name=$(basename "$repo")

worktree_name=$(prompt_worktree_name) || exit 0

[[ -z "$worktree_name" ]] && exit 0

mkdir -p "$WORKTREES_DIR/$repo_name"

path="$WORKTREES_DIR/$repo_name/$worktree_name"

if [[ -d "$path" ]]; then
    launch_tmux_session \
        "$repo_name/$worktree_name" \
        "$path"
    exit 0
fi

git -C "$repo" worktree add \
    -b "worktree/$worktree_name" \
    "$path" \
	>/dev/null

launch_tmux_session \
    "$repo_name/$worktree_name" \
    "$path"
