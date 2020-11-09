#!/bin/bash

# Helper script to run cargo doc recursively in repositories with multiple
# workspaces
 


red=`tput setaf 1`
green=`tput setaf 2`


root_dir=$(git rev-parse --show-toplevel)


run(){
	for i in *
	do
		if [ -d $i ]
		then 
			cd $i
			cargo doc
			cd $root_dir
		fi
	done
}

print_help(){
	echo "Helper script to run cargo doc recursively in repositories with multiple"
	echo "Usage:"
	echo "From withing a Rust repo:"
	echo "gen_doc.sh"
}

if [ -z $1 ]
then
	run
else
	print_help
fi
