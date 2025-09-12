#!/bin/bash

mode="$1"

if [[ "$mode" == "get-sinks" ]]; then
  option="$2"
  ids="$(wpctl status | sed -e '1,/Sinks:/ d' -e '/Sink endpoints:/ q' | sed '/\├/q' | head -n -2 | grep -o "^[^\.]*" | grep -o '[[:digit:]]\+')"
  if [[ "$option" == "name" ]]; then
    while read -r line; do
      wpctl inspect "$line" | grep "node.nick" | sed 's/ \* node.nick = \"//' | grep -o "[^\"]*"
    done <<< $ids
  elif [[ "$option" == "id" ]] || [[ -z "$option" ]]; then
    echo "$ids"
  fi


elif [[ "$mode" == "set-default" ]]; then
  sink="${2:-}"
  tmp=1
  ((sink = sink + tmp))
  wpctl set-default $(wpctl status | sed -e '1,/Sinks:/ d' -e '/Sink endpoints:/ q' | sed '/\├/q' | head -n -2 | grep -o "^[^\.]*" | grep -o '[[:digit:]]\+' | head -n "$sink" | tail -n 1)


elif [[ "$mode" == "get-default" ]]; then
  option="$2"
  id="$(wpctl status | sed -e '1,/Sinks:/ d' -e '/Sink endpoints:/ q' | sed '/\├/q' | head -n -2 | grep " \* " | grep -o '[[:digit:]]\+' | head -n 1)"
  if [[ "$option" == "name" ]]; then
    wpctl inspect "$id" | grep "node.nick" | sed 's/ \* node.nick = \"//' | grep -o "[^\"]*"
  elif [[ "$option" == "id" ]] || [[ -z "$option" ]]; then
    echo "$id"
  fi
fi
