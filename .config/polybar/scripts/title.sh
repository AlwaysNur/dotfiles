#!/bin/bash

win_id=$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')

if [[ "$win_id" == "0x0" || -z "$win_id" ]]; then
    echo ""
    exit 0
fi

title=$(xprop -id "$win_id" WM_NAME 2>/dev/null | cut -d '"' -f 2)

if [[ -z "$title" ]]; then
    title=$(xprop -id "$win_id" _NET_WM_NAME 2>/dev/null | cut -d '"' -f 2)
fi

echo "${title:0:60}"
