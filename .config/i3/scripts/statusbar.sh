#!/bin/bash

readonly REFRESH_CYCLE=1 # in seconds

battery() {
	time_left=$(acpi -i | head -n 1 |  cut -d "%" -f 2 | tr ',' ' ')
	battery_status=$(acpi -i | head -n 1 | cut -d ":" -f 2 | cut -d "%" -f 1 | tr ',' ' ')
	echo "🔋$battery_status%$time_left"
}

now() {
	echo "$(date +'%a %F %H:%M:%S')"
}

loadfactor() {
	uptime | cut -d ':' -f 5 | cut -d ',' -f 1
}

main() {
	while true
	do 
		echo "$(now) |$(loadfactor) | $(battery) "
		sleep $REFRESH_CYCLE
	done
}

main
