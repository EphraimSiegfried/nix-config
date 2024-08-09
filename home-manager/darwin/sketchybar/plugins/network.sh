#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')
SSID=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')

if [[ $VPN != "" ]]; then
	COLOR=$MAROON
	ICON=$LOCK
	LABEL="$VPN"
elif [[ $IP_ADDRESS != "" ]]; then
	COLOR=$BLUE
	ICON=$WIFI
	# LABEL=$IP_ADDRESS
	LABEL=$SSID
else
	COLOR=$WHITE
	ICON=$NO_WIFI
	LABEL="Not Connected"
fi

sketchybar --set $NAME label.color=$COLOR \
	icon.color=$COLOR \
	icon=$ICON \
	label="$LABEL"
