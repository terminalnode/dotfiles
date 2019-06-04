# This file is sourced on login.
# Very similar to .zprofile except sourced right after .zshrc.
[ ! -s ~/.config/mpd/pid ] &&  [ -x "$(command -v mpd)" ] && mpd
