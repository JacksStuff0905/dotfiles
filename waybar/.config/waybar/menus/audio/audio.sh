#!/bin/bash

#res_x=$(hyprctl monitors | awk -v id="$(hyprctl activeworkspace | grep -o "^\s*monitorID: [0-9]*$" | grep -o "[0-9]*")" '$0 ~ "Monitor .*\\(ID "id"\\):" {f=1; next} f && /^[[:space:]]*[0-9]+x[0-9]+@/ {split($1,a,"@"); print a[1]; exit}' | grep -o "^[0-9]*")

mouse_x=$(hyprctl cursorpos | grep -o "^[0-9]*")
((mouse_x = mouse_x - 150))

eww --config "$(dirname "$0")" open --toggle audio_closer
eww --config "$(dirname "$0")" open --toggle --arg pos_x="${mouse_x}px" audio

#if [[ -z "$(eww --config "$(dirname "$0")" active-windows | grep -o "audio: audio")" ]] || [[ -z "$(eww --config "$(dirname "$0")" active-windows | grep -o "audio_closer: audio_closer")" ]]; then
#  hyprctl keyword unbind ,W
#fi

# Hyprland specific escape detection
if type hyprctl &> /dev/null; then
echo "$(dirname "$0")"
  hyprctl keyword bindn ,escape,exec,"eww --config $(dirname "$0") close audio; eww --config $(dirname "$0") close audio_closer; hyprctl keyword unbind ,escape"
fi

