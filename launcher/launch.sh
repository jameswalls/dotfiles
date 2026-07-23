#!/bin/bash

launch_tmux_session() {
	if ! tmux has-session -t "$1" 2>/dev/null; then
		tmux new-session -d -s $1
		tmux rename-window -t $1:1 "terminal"
		tmux new-window -t $1:2 -n "nvim"
		tmux send-keys -t $1:2 "nvim ." C-m
		tmux send-keys -t $1:1 "clear" C-m
		tmux select-window -t $1:1
		tmux select-pane -t 1
	fi

	tmux attach-session -t $1
}

# Find all directories that contain a .git subdirectory, then use fzf for selection
PROJECTS_DIR=$HOME/projects
git_path=$(fd -H -I --type d --prune --min-depth 2 --max-depth 2 '\.git$' $PROJECTS_DIR | xargs -I {} dirname {} | fzf)


# Check if a repository was selected
if [ -z "$git_path" ]; then
  echo "No repository selected."
  exit 1
fi

cd $git_path
session_name=$(basename "$git_path")

if [ $MULTIPLEXER == "zellij" ]; then
	zellij attach -c $session_name
elif [ $MULTIPLEXER == "tmux" ]; then
	repo_name=$(basename "$git_path")
	repo_name="${repo_name//./_}"
	launch_tmux_session $repo_name
else
	echo "MULTIPLEXER env variable not set :("
fi
