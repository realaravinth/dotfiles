#!/bin/bash

readonly TTL=1
readonly APP="Launch Control"
readonly NOTIFICATION_CATEGORY="Launch Control"

set -x

notify() {
	notify-send --urgency=critical \
		--icon=/home/aravinth/Pictures/batman-logo-white-gb.png \
		--app-name="$APP" \
		--expire-time=$TTL \
		--category="$NOTIFICATION_CATEGORY" \
		"$APP" "$1"
}

if $(swaync-client --toggle-dnd)
then
	notify "Rigged for Silent Running"
else 
	notify "Decloaking"
fi
