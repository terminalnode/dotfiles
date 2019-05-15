#!/bin/bash
# Simple utility to change the volume in pactl without going over a certain limit.
# If you don't care about limits this script can be replaced by a simple command:
#   pactl set-sink-volume @DEFAULT_SINK@ +$(volume)%
# where $(volume) is the amount you want to increase by.

function current_volume {
    # Thank you stack exchange. :)
    SINK=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
    NOW=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
    return $NOW
}

# Stop script if no input.
if [[ -z $1 ]]; then
    exit 33
fi

current_volume
DESIRED_VOLUME=$(($NOW + $1))

if [[ $DESIRED_VOLUME -gt 100 ]]; then
    DESIRED_VOLUME=100
fi

pactl set-sink-volume @DEFAULT_SINK@ $DESIRED_VOLUME%
