# This script sets the volume to 40% if at home, otherwise mutes.
# If the SSID was previously "siegi", it does not trigger anything.

home_ssid="siegi"
# TODO: change path
last_ssid_file="Users/siegi/.last_ssid"

current_ssid="$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')"

# Read the last known SSID
last_ssid=""
if [[ -f "$last_ssid_file" ]]; then
	last_ssid=$(cat "$last_ssid_file")
fi

# Only trigger if the previous SSID was not "siegi"
if [[ "$last_ssid" != "$home_ssid" ]]; then
	if [[ "$current_ssid" == "$home_ssid" ]]; then
		set_volume 40
	else
		set_volume 0
	fi
fi

# Save the current SSID for the next run
echo "$current_ssid" >"$last_ssid_file"

set_volume() {
	osascript -e "set volume output volume $1"
}
