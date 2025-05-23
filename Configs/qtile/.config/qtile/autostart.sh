#!/usr/bin/env bash
set -euo pipefail

picom &
#autorandr -c
#sleep 0.5
dunst &
notify-send Qtile "Dunst Started. Performing startup tasks"
#sh /home/alex/.config/polybar/launch.sh &

# Autostart powersaving
xscreensaver --no-splash &
xautolock -time 30 -locker 'systemctl suspend' -notify 30 -notifier dunstify &

# Set Wallpaper
if [ -f /home/alex/.fehbg ]; then /home/alex/.fehbg & fi

# Load ~/.nvidia-settings-rc
if ( lsmod | grep 'nvidia' ); then nvidia-settings --load-config-only & fi

# Autostart apps
bash "/home/alex/.config/qtile/AppStart.sh" &
