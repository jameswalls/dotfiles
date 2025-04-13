#!/bin/bash

# Find all directories that contain a .git subdirectory, then use fzf for selection
PROJECTS_DIR=~/projects
git_path=$(fd -H -I --type d --prune '\.git$' $PROJECTS_DIR | xargs -I {} dirname {} | fzf --preview 'tree -L 2 -C {}')

# Check if a repository was selected
if [ -z "$git_path" ]; then
  echo "No repository selected."
  exit 1
fi

code $git_path
