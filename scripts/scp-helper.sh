#!/bin/bash

mimic_dir(){
	for i in $1/*
	do
		if [ -d $i ]
		then 
			mkdir -p /tmp/$i
			make_dir $i
		fi
	done
}

help(){
	echo "Mimics directory structure on remote machine so that scp can be initialized parallely"
	echo "Usage: scp-helper.sh <dir name> <fqdn-remote:location>"
}


send_files(){
	for i in $1/*
	do
		mv $i $(echo $i | tr ' ' '-')
		echo $i
		if [ ! -d $i ]
		then 
			echo $i
			scp  $i $2/$i &
		fi
	done
}

if [ -z $1 ] || [ -z $2 ]
then
	help
else
	mimic_dir $1
	scp -r /tmp/$1 $2
	send_files $1 $2
fi
