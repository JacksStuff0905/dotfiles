#!/bin/bash

# Generate menu items
menu=$(nmcli -t -f active,ssid dev wifi | awk -F: '{if ($2) {if ($1 == "yes") print "󱔀 " $2; else print "󰝣 " $2}}' | wofi --dmenu -p "Select WiFi" --width 400)

# Extract SSID from selection
ssid=$(echo "$menu" | sed 's/.* //')

# If empty or canceled
[ -z "$ssid" ] && exit

# Connect using nmcli (you may need to input password once or use secrets)
nmcli dev wifi connect "$ssid"
