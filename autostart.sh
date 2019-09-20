#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}



# Run Programs
run xrandr --output HDMI-0 --primary --pos 0x0 --output DVI-I-1 --pos 1920x0
run numlockx
run mpd
run wal -R
run feh --bg-scale ~/.wallpapers/bg1.png ~/.wallpapers/bg2.png
run caffeine
run blueman-applet
run redshift
run compton -b
