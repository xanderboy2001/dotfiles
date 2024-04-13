#!/usr/bin/env bash
set -euo pipefail

#autorandr -c
#sleep 0.5
picom &
dunst &
notify-send Qtile "Dunst Started. Performing startup tasks"
#sh /home/alex/.config/polybar/launch.sh &

# Autostart powersaving
xscreensaver --no-splash &
xautolock -time 30 -locker 'systemctl suspend' -notify 30 -notifier dunstify &

# Set Wallpaper
/home/alex/.fehbg &

# Autostart apps
bash "/home/alex/.config/qtile/AppStart.sh" &
