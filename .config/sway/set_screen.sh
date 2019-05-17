#!/bin/sh
# Stop script if no input.
if [ -z $1 ]; then exit 33; fi

# Check maximum and current values.
LIGHT="/sys/class/backlight/intel_backlight"
MAX=$( cat $LIGHT/max_brightness )
NOW=$( cat $LIGHT/brightness )

# Calculate desired brightness as percentage of MAX.
# Then remove trailing decimals.
DESIRED=$(echo "scale=2; $MAX / 100 * $1" | bc | sed "s/\..*//")
DESIRED=$(($NOW + $DESIRED))

# If DESIRED would go above max or below 0, set to max or 0.
[ "$DESIRED" -gt "$MAX" ] && DESIRED=$MAX
[ "$DESIRED" -lt 0 ] && DESIRED=0

# Send the result to brightness.
echo $DESIRED >> $LIGHT/brightness
