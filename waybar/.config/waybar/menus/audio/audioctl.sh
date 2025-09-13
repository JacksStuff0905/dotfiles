#!/bin/bash

mode="$1"

sample_name="samples/sample%d.wav"


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

elif [[ "$mode" == "set-volume" ]]; then
  volume="$2"
  sample=${3:-0}
  wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ "$volume"%

  # Play sample
  sample_file="$(printf "$sample_name" $sample)"
  
  if [[ -z "$(pw-dump Node | grep -i "$sample_file")" ]]; then
    # The sample is not yet playing
    pw-play "$sample_file"
  fi
fi
