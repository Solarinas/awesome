#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}



# Run Programs
run xrandr --output HDMI-0 --primary --pos 0x0 --output DVI-I-1 --pos 1920x0
run emacs --daemon
run numlockx on
run mpd
run mpDris2
run feh --bg-scale ~/.wallpapers/bg1.png ~/.wallpapers/bg2.png
run caffeine
# run nm-applet
# run redshift
run picom --config .picom.conf --experimental-backends
run wal -R
run ckb-next --background
run nextcloud
run transmission-daemon
run udiskie
