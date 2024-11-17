# This script sets the volume to 30% if at home and else mutes
#
home_ssid="siegi"

get_ssid="$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')"
set_volume(){
  osascript -e "set volume output volume $1"
}

if [[ "${get_ssid}" == "$home_ssid" ]]; then
  set_volume 40
else 
  set_volume 0
fi
