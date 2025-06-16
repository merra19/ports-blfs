#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# Otherwise you can use the nuclear option:
killall -q polybar

wait
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo $m
    MONITOR=$m polybar --reload bar &
  done
else
  polybar --reload bar &
fi
