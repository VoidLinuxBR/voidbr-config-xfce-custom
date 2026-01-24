#!/bin/sh

if [ "$DESKTOP_SESSION" = "xfce" ] || [ "$DESKTOP_SESSION" = "livecd" ]; then 
   sleep 2s
   killall conky
   cd "$HOME/.conky/Chili-Minimal"
   conky -c "$HOME/.conky/Chili-Minimal/Chili-Minimal.conf" &
   exit 0
fi
