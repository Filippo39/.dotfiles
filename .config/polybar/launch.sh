#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
#polybar top -c ~/.config/polybar/config.ini &

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo $m
    MONITOR=$m polybar --reload left &
    MONITOR=$m polybar --reload center &
    MONITOR=$m polybar --reload right &
  done
else
  polybar --reload example &
fi
