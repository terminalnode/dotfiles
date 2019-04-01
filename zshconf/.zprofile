# This file is sourced on login.
# Very similar to .zlogin except sourced right before .zshrc.

# Basic environmental variables
export EDITOR=vim
export VISUAL=vim
export BROWSER=firefox
export TERMINAL=termite

# fcitx input method
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx

# ibus input method
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export IBUS_ENABLE_SYNC_MODE=1

# Wayland stuff
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# Broken for many programs and games:
# export SDL_VIDEODRIVER=wayland

# Disabled but kept for future reference
# Set a couple of HiDIP settings
# Wayland already handles scaling great.
# export OPENRA_DISPLAY_SCALE=2
# export GDK_DPI_SCALE=0.5
# export GDK_SCALE=2
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export ELM_SCALE=1.5