#!/bin/bash

# This function lists events for a given day offset (e.g., 0 for today, 1 for tomorrow).
list_events() {
	source "$HOME/.config/sketchybar/colors.sh"
	SEP="%"
	EVENT_COUNT=0
	DAY_COUNT=$1
	local args=() # Use a local array directly instead of nameref.

	args+=(--remove '/ical.day.*/' --remove '/ical.event.*/')

	# Determine the date for the given day count.
	DATE=$(date -v+${DAY_COUNT}d +"%d.%b")
	DAY_LABEL=$(date -v+${DAY_COUNT}d +"%a %d.%b")

	# Configure the day display in the SketchyBar.
	args+=(--clone ical.day.$DAY_COUNT ical.template
		--set ical.day.$DAY_COUNT icon="$DAY_LABEL"
		icon.color=$GREEN
		click_script="sketchybar --set $NAME popup.drawing=off"
		position=popup.ical
		drawing=on)

	[ "${DAY_COUNT}" -eq 0 ] && args+=(--set ical.day.$DAY_COUNT drawing=off)

	EVENTS="$(icalBuddy -eed -n -nc -nrd -npn -ea -df "" -tf "%H.%S" -iep datetime,title -b '' -ps "|$SEP|" eventsFrom:$DATE to:$DATE)"

	# Process each event.
	while IFS="${SEP}" read -r time title; do
		((EVENT_COUNT++))
		[ -z "$time" ] && time="No events" && title=":)"
		args+=(--clone ical.event.$EVENT_COUNT ical.template
			--set ical.event.$EVENT_COUNT label="$title"
			icon="$time"
			icon.color=$YELLOW
			click_script="sketchybar --set $NAME popup.drawing=off"
			position=popup.ical
			drawing=on)
	done <<<"$EVENTS"

	# Apply changes in SketchyBar.
	sketchybar -m "${args[@]}" >/dev/null
}

mouse_clicked() {
	local args=() # Declare args locally.
	DAY_COUNT=$(sketchybar --query ical | jq -r '.popup.items[] | select(startswith("ical.day.")) | split(".")[-1]')
	if [ "$BUTTON" = "left" ]; then
		((DAY_COUNT++))
	else
		[ $DAY_COUNT -gt 0 ] && ((DAY_COUNT--))
	fi
	list_events $DAY_COUNT
}

update() {
	local args=() # Declare args locally.
	list_events 0
	EVENTS="$(icalBuddy -eed -n -nc -nrd -npn -ea -df "" -tf "%H.%S" -iep datetime -b '' -ps "|$SEP|" eventsToday)"
	if [ -n "$EVENTS" ]; then
		args+=(--set $NAME label="$(echo "$EVENTS" | head -n1)")
	else
		args+=(--set $NAME label="" label.width=0)
	fi
	sketchybar -m "${args[@]}" >/dev/null
	[ "$SENDER" = "forced" ] && sketchybar --animate tanh 15 --set "$NAME" label.y_offset=5 label.y_offset=0
}

popup() {
	sketchybar --set "$NAME" popup.drawing="$1"
}

# Main case logic to handle events.
case "$SENDER" in
"routine" | "forced") update ;;
"mouse.entered") popup on ;;
"mouse.exited.global")
	popup off
	update
	;;
"mouse.clicked") mouse_clicked ;;
esac
