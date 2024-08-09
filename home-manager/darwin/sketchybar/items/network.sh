#!/bin/bash

network=(
	script="$PLUGIN_DIR/network.sh"
	icon.font="MesloLGS NF:Bold"
	icon.font.size=14
	update_freq=30
	background.border_width=0
	background.corner_radius=6
	background.height=24
)

sketchybar --add item network right \
	--set network "${network[@]}" \
	--subscribe network wifi_change
