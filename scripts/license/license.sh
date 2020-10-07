#!/bin/bash

# Some of my codebases were licenced under GPL-1.0, complete with licence
# headers and all. I wrote this scripts to get rid of those licence headers

# Please note that this one changes rust filetypes, change the extention
# in the 30th line to make it work with other filetypes. Or go crazy and write 
# a whole new thing to accept filetypes!


red=`tput setaf 1`
green=`tput setaf 2`

rust_licence=~/dotfiles/scripts/license/rust

# $1 is filename
# $3 is licence text, changes for every extention type
upgrade_licence() {
	if grep -q "You should have" $1 ; then
		echo "${red}Licence header found at: $1"
	else
		cat $2 > $1.new
		echo >> $1.new
		echo >> $1.new
		echo >> $1.new
		cat $1 >> $1.new
		mv $1.new $1
		echo "${green}Added licence header to: $1"
	fi
}


# $1 is file
filetype() {
	echo ${1##*.}
}


root_dir=$(git rev-parse --show-toplevel)


# $1 is the preferred filetype
run(){
	if [ $1 == 'rs' ]
	then
		licence=$rust_licence
	fi
	for file in $( git ls-files)
	do
		if [ $(filetype $file) == $1 ]
		then
			upgrade_licence $root_dir/$file $licence
		fi
	done

}

print_help(){
	echo "Helper script to prepend licence header to all source files in the git repository"
	echo "Usage: license.sh <filetype-of-the-source-file-that-you-wish-to-modify>"
}

if [ -z $1 ]
then
	print_help
else
	run $1
fi
