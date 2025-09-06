#!/bin/bash

if [[ -n $(pgrep hypridle) ]] then
  killall hypridle
  #notify-send " 󰒳  " " Disabled hypridle"
else
  #notify-send " 󰒲 " " Enabled hypridle"
  nohup hypridle > /dev/null &
fi
