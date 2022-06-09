#!/bin/bash
# Simple script to s̵i̵l̵e̵n̵c̵e̵ ̵e̵m̵b̵a̵r̵a̵s̵s̵i̵n̵g̵ ̵n̵o̵t̵i̵f̵i̵c̵a̵t̵i̵o̵n̵s̵ silence Akhil(@officialakhil)

readonly TTL=1
readonly APP="Launch Control"
readonly NOTIFICATION_CATEGORY="Launch Control"

set -x

notify() {
	notify-send --urgency=critical \
		--icon=/src/atm/Pictures/batman.png \
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
