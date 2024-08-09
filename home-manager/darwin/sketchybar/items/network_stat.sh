#!/usr/bin/env bash

source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

network_down=(
	y_offset=-5
	label.font="$FONT:Heavy:10"
	label.color="$WHITE"
	icon="$NETWORK_DOWN"
	icon.font="$NERD_FONT:Bold:18.0"
	icon.color="$GREEN"
	icon.font.size=7
	icon.highlight_color="$BLUE"
	update_freq=1
)

network_up=(
	background.padding_right=-73
	y_offset=7
	label.font="$FONT:Heavy:10"
	label.color="$WHITE"
	icon="$NETWORK_UP"
	icon.font="$NERD_FONT:Bold:18.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	icon.font.size=7
	update_freq=1
	script="$PLUGIN_DIR/network_stat.sh"
)

sketchybar --add item network.down right \
	--set network.down "${network_down[@]}" \
	--add item network.up right \
	--set network.up "${network_up[@]}"
