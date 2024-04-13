#!/usr/bin/env bash


## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5
## style-6   style-7   style-8   style-9   style-10

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-2"
theme='style-6'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`uname -n`

# Options
shutdown='⏻' 
reboot='󰜉'
windows=''
lock='󱅞'
suspend='󰤄'
logout='󰍃'
yes='󰗠'
no='󰰱'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
	-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$suspend\n$lock\n$logout\n$reboot\n$windows\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
        case $1 in
            '--shutdown')
                systemctl poweroff
                ;;
            '--reboot')
		systemctl reboot
                ;;
            '--windows')
                reboot2windows
                ;;
            '--lock')
                if [[ -x '/usr/bin/light-locker' ]]; then
                    light-locker-command -l
                elif [[ -x '/usr/bin/i3lock' ]]; then
                    i3lock
                elif [[ -x '/usr/bin/xscreensaver' ]]; then
                    xscreensaver-command --lock
                fi
                ;;
            '--suspend')
                systemctl suspend
                ;;
            '--logout')
                case "$DESKTOP_SESSION" in
                    'qtile')
                        qtile cmd-obj -o cmd -f shutdown
                        ;;
                    'openbox')
                        openbox --exit
                        ;;
                    'bspwm')
                        bspc quit
                        ;;
                    'i3')
                        i3-msg exit
                        ;;
                    'plasma')
                        qdbus org.kde.ksmserver /KSMServer logout 0 0 0
                        ;;
                    *)
                        pkill -KILL -u $USER
                        ;;
                esac
        esac
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
	run_cmd --shutdown
        ;;
    $reboot)
	run_cmd --reboot
        ;;
    $lock)
        run_cmd --lock
        ;;
    $suspend)
	run_cmd --suspend
        ;;
    $logout)
	run_cmd --logout
        ;;
esac
