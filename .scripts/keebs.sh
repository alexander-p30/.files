#!/bin/bash
setxkbmap -layout us -variant intl
kmonad ~/.config/kmonad_maps/k2.kbd &
kmonad ~/.config/kmonad_maps/lenovo.kbd &
notify-send 'Keyboard config reset'

