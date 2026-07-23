#!/usr/bin/env bash

launch_tmux_session() {
    local session="$1"
    local dir="$2"

    if ! tmux has-session -t "$session" 2>/dev/null; then
        tmux new-session -d \
            -s "$session" \
            -c "$dir"

        tmux rename-window \
            -t "$session:1" \
            terminal

        tmux new-window \
            -t "$session:2" \
            -n nvim \
            -c "$dir"

        tmux send-keys \
            -t "$session:2" \
            "nvim ." \
            C-m

        tmux select-window \
            -t "$session:1"
    fi

    tmux switch-client -t "$session"
}
