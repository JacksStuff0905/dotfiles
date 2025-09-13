#!/bin/bash

eww daemon --config $HOME/.config/waybar/menus/audio/. &> /dev/null

volume_pctg="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed "s/Volume: //" | awk '{printf $0 * 100}')"

mute="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "\[MUTED\]$")"

if [[ -n "$mute" ]]; then
  echo -e "{\"alt\": \"mute\"}"
  exit
fi

echo -e "{\"percentage\": $volume_pctg}"
