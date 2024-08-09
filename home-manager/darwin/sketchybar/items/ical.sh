#!/bin/bash

# Configuration for the ical item
ical=(
	script="$PLUGIN_DIR/ical.sh"
	update_freq=180
	icon=􀉉
	icon.color="$YELLOW"
	label.color="$YELLOW"
	label.width=0
	popup.align=right
	background.border_width=0
)

# Configuration for the ical template (popup)
ical_template=(
	drawing=off
	background.corner_radius=12
	padding_left=7
	padding_right=7
)

# Define common mouse event triggers
events=(
	mouse.entered
	mouse.exited
	mouse.exited.global
	mouse.clicked
)

# Add and configure the ical item
sketchybar --add item ical right \
	--set ical "${ical[@]}" \
	--subscribe ical "${events[@]}"

# Add and configure the ical template item
sketchybar --add item ical.template popup.ical \
	--set ical.template "${ical_template[@]}"
