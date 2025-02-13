#!/bin/bash

# Find all directories that contain a .git subdirectory, then use fzf for selection
PROJECTS_DIR=~/projects
git_path=$(fd -H -I --type d --prune '\.git$' $PROJECTS_DIR | xargs -I {} dirname {} | fzf --preview 'tree -L 2 -C {}')

# Check if a repository was selected
if [ -z "$git_path" ]; then
  echo "No repository selected."
  exit 1
fi

cd $git_path

if [ -d .venv ]; then
	VENV_DIR=".venv"
elif [ -d venv ]; then
	VENV_DIR="venv"
else
	VENV_DIR=
fi

repo_name=$(basename "$git_path")
repo_name="${repo_name//./_}"

if ! tmux has-session -t "$repo_name" 2>/dev/null; then
	tmux new-session -d -s $repo_name

	tmux rename-window -t $repo_name:1 "terminal"
	tmux new-window -t $repo_name:2 -n "nvim"

	if [ -n "$VENV_DIR" ]; then
		tmux send-keys -t $repo_name:1 "source ${VENV_DIR}/bin/activate" C-m
		tmux send-keys -t $repo_name:2 "source ${VENV_DIR}/bin/activate" C-m
	fi

	tmux send-keys -t $repo_name:2 "nvim ." C-m

	tmux send-keys -t $repo_name:1 "clear" C-m

	tmux select-window -t $repo_name:1
	tmux select-pane -t 1
fi

tmux attach-session -t $repo_name

