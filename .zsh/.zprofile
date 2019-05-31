# This file is sourced on login
# Order is: .zprofile -> .zshrc -> .zlogin

###################
### ENVIRONMENT ###
###################
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=qutebrowser
export TERMINAL=termite

###############
### WAYLAND ###
###############
### Java
export _JAVA_AWT_WM_NONREPARENTING=1
### Qt
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# export QT_WAYLAND_FORCE_DPI=physical
### GTK
# export GDK_BACKEND=wayland
export CLUTTER_BACKEND=wayland
### SDL
# export SDL_VIDEODRIVER=wayland

############
### XORG ###
############
# Currently not in use. Kept for future reference.
# Sway handles scaling for us.
# export OPENRA_DISPLAY_SCALE=2
# export GDK_DPI_SCALE=0.5
# export GDK_SCALE=2
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export ELM_SCALE=1.5
