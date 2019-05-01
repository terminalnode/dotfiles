# This file is sourced on login.
# Very similar to .zlogin except sourced right before .zshrc.

# Basic environmental variables
export EDITOR=vim
export VISUAL=vim
export BROWSER=qutebrowser
export TERMINAL=termite

# Activate ibus if it's installed.
if [[ -x $(command -v ibus-daemon) ]] && [[ -z $TMUX ]]; then
    export GTK_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export QT_IM_MODULE=ibus
    export IBUS_ENABLE_SYNC_MODE=1
    ibus-daemon -drx
fi

# Wayland stuff
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# Broken for many programs and games:
# export SDL_VIDEODRIVER=wayland

# X-specific settings for HiDPI displays.
# Currently not in use. Kept for future reference.
# export OPENRA_DISPLAY_SCALE=2
# export GDK_DPI_SCALE=0.5
# export GDK_SCALE=2
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export ELM_SCALE=1.5
