#!/bin/bash

readonly TTL=1
readonly PING_TIMEOUT=2 # in seconds
readonly APP="Launch Control"
readonly NOTIFICATION_CATEGORY="Launch Control"
readonly OFFLINE_STATUS="offline"
readonly ONLINE_STATUS="online"

notify() {
	notify-send --urgency=critical \
		--icon=/home/aravinth/Pictures/batman-logo-white-gb.png \
		--app-name="$APP" \
		--expire-time=$TTL \
		--category="$NOTIFICATION_CATEGORY" \
		"$APP" "[$(date +'%H:%M:%S')] $1"

}

readonly IP=8.8.8.8

network_status=$ONLINE_STATUS

while true
do
	if ping -c 1 -W $PING_TIMEOUT $IP &> /dev/null
	then
		if [ $network_status = $OFFLINE_STATUS ]
		then
		  network_status=$ONLINE_STATUS
		  notify "You are $ONLINE_STATUS"
		fi
	else
		if [ $network_status = $ONLINE_STATUS ]
		then
		  network_status=$OFFLINE_STATUS
		  notify "You are $OFFLINE_STATUS"
		fi
	fi
done
