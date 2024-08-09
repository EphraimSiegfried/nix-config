#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ ${CHARGING} != "" ]]; then
	ICON=$BATTERY_CHARGING
	COLOR=$GREEN
else
	case ${BATT_PERCENT} in
	9[0-9] | 100)
		ICON=$BATTERY_100
		COLOR=$GREEN
		;;
	[6-8][0-9])
		ICON=$BATTERY_75
		COLOR=$YELLOW
		;;
	[3-5][0-9])
		ICON=$BATTERY_50
		COLOR=$PEACH
		;;
	[1-2][0-9])
		ICON=$BATTERY_25
		COLOR=$RED
		;;
	*)
		ICON=$BATTERY_0
		COLOR=$RED
		;;
	esac
fi

updated_properties=(
	icon="${ICON}"
	icon.color="${COLOR}"
	label="${BATT_PERCENT}"
	label.color="${COLOR}"
)

sketchybar --set "$NAME" "${updated_properties[@]}"
