#!/bin/bash
setxkbmap -layout us -variant intl
sleep 0.4
killall kmonad
kmonad ~/.config/kmonad_maps/k2.kbd &
kmonad ~/.config/kmonad_maps/lenovo.kbd &
notify-send 'Keyboard config reset' -t 1500
