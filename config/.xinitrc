#!/bin/sh
## wall=$(find ~/backgrounds | shuf -n 1)
num_monitors=$(xrandr | grep -c ' connected')

if [ "$num_monitors" -gt 1 ]; then
        extramonitor.sh disconnect
fi
wall=~/backgrounds/background.jpg
feh --bg-fill $wall
wal --theme $HOME/.cache/wal/schemes/_home_aleksic_backgrounds_background_jpg_dark_None_0.75_1.1.0.json

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --output "HDMI-1" --mode 1920x1080 &
slstatus &
picom -b --backend glx --vsync --no-use-damage --corner-radius 35 --animations --animation-window-mass 1.25 --animation-for-open-window zoom --animation-stiffness 400 &
exec dwm

