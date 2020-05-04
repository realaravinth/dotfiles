#!/bin/bash

while [ true ]

	status=$(bluetoothctl connect 
		thctl connect 38:18:4C:11:C7:63 | tail -n 1)
	if [ $status = "Connection successful" ]
	then
		 #BLUETOOTH_HEADST=true
		echo 'bluez_sink.38_18_4C_11_C7_63.a2dp_sink' > ~/.vars/audio-output
		break
	fi
done
