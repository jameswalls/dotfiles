#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux bind-key G run-shell "bash '$CURRENT_DIR/scripts/create.sh'"
tmux bind-key g run-shell "bash '$CURRENT_DIR/scripts/open.sh'"
