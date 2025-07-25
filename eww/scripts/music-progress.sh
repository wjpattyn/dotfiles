#!/bin/bash

pos=$(playerctl position --ignore-player=firefox 2>/dev/null)
len_us=$(playerctl metadata mpris:length --ignore-player=firefox 2>/dev/null)

if [ -z "$pos" ] || [ -z "$len_us" ] || [ "$len_us" -eq 0 ]; then
    echo 0
    exit 0
fi

awk -v pos="$pos" -v len_us="$len_us" '
BEGIN {
  len = len_us / 1000000;
  percent = (pos / len) * 100;
  printf "%d\n", percent
}'