#!\bin\bash

mute_ssid="LeSiegi"

get_ssid="$(networksetup -getairportnetwork en0 | sed -E 's,^Current Wi-Fi Network: (.+)$,\1,')"
set_volume(){
  osascript -e "set volume output volume $1"
}

if [[ "${get_ssid}" == "$mute_ssid" ]]; then
  set_volume 0
else 
  echo "${get_ssid}"""
  set_volume 30
fi

