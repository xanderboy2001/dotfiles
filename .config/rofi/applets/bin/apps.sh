#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Favorite Applications

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt='Quick-Apps'
mesg="Installed Packages : `pacman -Q | wc -l` (pacman)"

if [[ ( "$theme" == *'type-1'* ) || ( "$theme" == *'type-3'* ) || ( "$theme" == *'type-5'* ) ]]; then
	list_col='2'
	list_row='5'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
	list_col='6'
	list_row='1'
fi

# CMDs (add your apps here)
file_cmd='thunar'
text_cmd='lowriter'
steam_cmd='steam -noverifyfiles'
#vm_cmd='/home/alex/Scripts/virt-launcher Windows'
vm_cmd='virt-manager'
work_cmd='/home/alex/Scripts/work-launcher'
email_cmd='thunderbird'
no_sleep_cmd='xautolock -toggle'
upgrade_cmd='alacritty -e yay -Syyu'

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1="<span size='large' color='#ff79c6'></span> Files <span weight='light' size='small' color='#6272a4'><i>($file_cmd)</i></span>"
	option_2="<span size='large' color='#ff79c6'></span> Writer <span weight='light' size='small' color='#6272a4'><i>($text_cmd)</i></span>"
	option_3="<span size='large' color='#ff79c6'></span> VM <span weight='light' size='small' color='#6272a4'><i>($vm_cmd)</i></span>"
  option_4="<span size='large' color='#ff79c6'></span> Work <span weight='light' size='small' color='#6272a4'><i>($work_cmd)</i></span>"
  option_5="<span size='large' color='#ff79c6'>󰇮</span> Email <span weight='light' size='small' color='#6272a4'><i>($email_cmd)</i></span>"
  option_6="<span size='large' color='#ff79c6'>󰤄</span> Toggle Sleep <span weight='light' size='small' color='#6272a4'><i>($no_sleep_cmd)</i></span>"
  option_7="<span size='large' color='#ff79c6'></span> Upgrade <span weight='light' size='small' color='#6272a4'><i>($upgrade_cmd)</i></span>"
else
	option_1=""
	option_2=""
  option_3=''
  option_4="w\0icon\x1ffolder"
fi

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: " ";}' \
		-dmenu \
		-p "$prompt" \
		-markup-rows \
		-theme ${theme}
}


# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_5\n$option_7" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		${file_cmd}
	elif [[ "$1" == '--opt2' ]]; then
		${text_cmd}
	elif [[ "$1" == '--opt3' ]]; then
		${vm_cmd}
  elif [[ "$1" == '--opt4' ]]; then
    ${work_cmd}
  elif [[ "$1" == '--opt5' ]]; then
    ${email_cmd}
  elif [[ "$1" == '--opt6' ]]; then
    ${no_sleep_cmd}
  elif [[ "$1" == '--opt7' ]]; then
    ${upgrade_cmd}
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
    run_cmd --opt4
        ;;
    $option_5)
    run_cmd --opt5
        ;;
    $option_6)
    run_cmd --opt6
        ;;
    $option_7)
    run_cmd --opt7
        ;;
esac
