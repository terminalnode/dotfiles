# This file is sourced on login
# Order is: .zprofile -> .zshrc -> .zlogin

###################
### ENVIRONMENT ###
###################
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=qutebrowser

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

export PATH="$HOME/.cargo/bin:$PATH"
