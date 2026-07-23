#!/usr/bin/env bash

set -euo pipefail

PROJECTS_DIR="${PROJECTS_DIR:-$HOME/projects}"
WORKTREES_DIR="${WORKTREES_DIR:-$HOME/worktrees}"

mkdir -p "$WORKTREES_DIR"

select_repo() {
	fd -H -I --type d --prune --min-depth 2 --max-depth 2 '\.git$' $PROJECTS_DIR |
	xargs -I {} dirname {} |
	fzf --tmux 50% --prompt='repo> ' --delimiter=/ --with-nth=-1
}

prompt_worktree_name() {
    fzf \
        --tmux 50%,10% \
        --prompt='Worktree name> ' \
        --print-query \
        --disabled \
        --border \
        </dev/null |
        head -n1 || true
}
