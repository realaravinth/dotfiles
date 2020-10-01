#!/bin/bash

create_component() {
	if [ -z $1 ] || [ -z $2 ]
	then
		help
	else
		mkdir $1 && touch $1/$1.$2
	fi
}


help() {
	echo "\tCreates file-name/file-name.extention"
	echo "\tUsage: "
	echo "\t\tcreate_component <filename> <extention>"
}
