#!/bin/bash

# Get clipboard history, remove entry numbers, trim whitespace, and find the first YouTube URL
url=$(cliphist list | awk '{$1=""; print $0}' | sed 's/^[ \t]*//' | grep -m1 -E 'https?://(www\.)?(youtube\.com|youtu\.be)')

# If a URL is found, play it in mpv
if [[ -n "$url" ]]; then
    mpv --ytdl-format="bestvideo[height<=1080]+bestaudio/best" "$url"
else
    notify-send "No YouTube URL found in clipboard history!"
fi
