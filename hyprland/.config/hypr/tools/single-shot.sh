#!/bin/bash
if pgrep -f hyprshot > /dev/null; then
  exit 0
else
  nohup hyprshot $@ > /dev/null &
fi
