#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Fix HiDPI stuff
export OPENRA_DISPLAY_SCALE=2
export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_DEVICE_PIXEL_RATIO=4
export GDK_SCALE=1.5
export GDK_DPI_SCALE=0.5
export ELM_SCALE=1.5

exec i3
