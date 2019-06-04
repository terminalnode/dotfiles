#!/bin/sh
# Simple utility to change the volume in pactl without going over a certain limit.
# If you don't care about limits this script can be replaced by a simple command:
#   pactl set-sink-volume @DEFAULT_SINK@ +$(volume)%
# where $(volume) is the amount you want to increase by.

getsink() {
    pacmd list-sinks |
        awk '/index:/{i++} /* index:/{print i; exit}'
}

getvolume() {
    pacmd list-sinks |
        awk '/^\svolume:/{i++} i=='"$(getsink)"'{print $5; exit}' |
        cut -d'%' -f1 # remove trailing % sign
}

getmute() {
    pacmd list-sinks |
        awk '/^\smuted:/{i++} i=='"$(getsink)"'{print $2; exit}'
}

# Stop script if no input.
if [ -z "$1" ]; then
    exit 33
fi

DESIRED_VOLUME=$(($(getvolume) + $1))

if [ $DESIRED_VOLUME -gt 100 ]; then
    DESIRED_VOLUME=100
fi

pactl set-sink-volume @DEFAULT_SINK@ $DESIRED_VOLUME%
