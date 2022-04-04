#!/bin/bash

get_anchor () {
	link=$(echo $1 | cut -d "#" -f 2)
	echo "#$link" | xclip
	echo "#$link" Copied to clipboard
}

get_anchor $1
