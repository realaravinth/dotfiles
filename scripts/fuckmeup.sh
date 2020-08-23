#!/bin/bash

fuckmeup () {
	v4l2-ctl --list-devices -d /dev/video0 --list-ctrls > ~/.config/current-webcam-settings
	v4l2-ctl --list-devices -d /dev/video0 --set-ctrl contrast=80
	v4l2-ctl --list-devices -d /dev/video0 --set-ctrl sharpness=0
	#v4l2-ctl --list-devices -d /dev/video0 --set-ctrl brightness=0
}

restore () {
	v4l2-ctl --list-devices -d /dev/video0 --set-ctrl contrast=50
	v4l2-ctl --list-devices -d /dev/video0 --set-ctrl sharpness=50
	v4l2-ctl --list-devices -d /dev/video0 --set-ctrl brightness=0

}

help () {
	echo "./fuckmeup.sh [options]
	options:
		-r			restores original configuration
		-f			fucks everything up
		-h			prints this menu
	"
}

if [ -z $1 ]
then
	echo "requries atleast one option"
	help
elif [ $1 == '-r' ]
then
	restore
elif [ $1 == '-f' ]
then
	fuckmeup
elif [ $1 =='-h' ]
then
	help
else
	echo "invalid option"
	help
fi
