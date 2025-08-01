#!/bin/bash

# Prompt Google Search via rofi
query=$(rofi -dmenu -p " " -theme ~/.config/rofi/google_search.rasi)

if [ -n "$query" ]; then
    url="https://www.google.com/search?q=$(echo "$query" | sed 's/ /+/g')"
    xdg-open "$url" & disown
fi
