#!/bin/bash
taskwarrior=(
	script="$PLUGIN_DIR/taskwarrior.sh"
	update_freq=120
	icon=󱃔
	icon.color=$ORANGE
	label.color=$ORANGE
)
task_template=(
	drawing=off
	background.corner_radius=12
	padding_left=7
	padding_right=7
)
events=(
	mouse.entered
	mouse.exited
)
sketchybar --add item taskwarrior right \
	--set taskwarrior "${taskwarrior[@]}" \
	--subscribe taskwarrior "${events[@]}" \
	--add item task.template popup.taskwarrior \
	--set task.template "${task_template[@]}"
