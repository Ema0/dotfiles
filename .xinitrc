#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp ~/.fonts           # Prepend a custom font path to Xorg's list of known font paths

xsetroot -solid black
setxkbmap -layout us -variant altgr-intl
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export XDG_CONFIG_HOME="$HOME/.config"


xsetroot -solid "#000000" &

xsetroot -cursor_name left_ptr &

lxpolkit &

urxvtd -q -o -f &

#~/Documents/code/scripts/w.sh &
systemctl --user start X.target &

compton -b &

#~/Programs/lime &

lemonbuddy_wrapper main &

nm-applet &

caffeine &

exec 2bwm
