# This file is sourced on logout.
[ -f ~/.config/mpd/pid ] && kill "$(cat .config/mpd/pid)"
