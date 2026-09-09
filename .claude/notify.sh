#!/bin/bash
input=$(cat)
event=$(jq -r '.hook_event_name // empty' <<<"$input")
msg=$(jq -r '.message // empty' <<<"$input")
[ "$event" = "Stop" ] && msg="Done, waiting for you"
[ -z "$msg" ] && exit 0

win=""
[ -n "$TMUX_PANE" ] && win=$(tmux display -p -t "$TMUX_PANE" '#S:#W' 2>/dev/null)
title="Claude${win:+ · $win}"

if command -v osascript >/dev/null 2>&1; then
    osascript -e "display notification \"${msg//\"/\\\"}\" with title \"$title\" sound name \"Glass\""
elif command -v notify-send >/dev/null 2>&1; then
    notify-send "$title" "$msg"
fi
exit 0
