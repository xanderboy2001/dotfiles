#!/usr/bin/env bash
set -euo pipefail

notify-send Qtile "Starting Apps" 
$HOME/.config/conky/start_conky_qtile.sh &
1password --silent &
caffeine &
greenclip daemon &
nm-applet &
pasystray &
redshift-gtk &
udiskie -t &
notify-send Qtile "Startup Complete" 
