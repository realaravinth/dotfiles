#!/bin/bash

# Some of my codebases were licenced under GPL-2.0, complete with licence
# headers and all. I wrote this scripts to get rid of those licence headers

# Please note that this one changes rust filetypes, change the extention
# in the 30th line to make it work with other filetypes. Or go crazy and write 
# a whole new thing to accept filetypes!


# $1 is filename
upgrade_licence() {
	licence_text_lines=$(cat $1 |  grep -n  Foundation | tail -n 1 | cut -d ':' -f 1)
	if [ ${#licence_text_lines} -gt 0 ]
	then
		lines=$(cat $1 | wc -l)
		cat $1 | tail -n $(expr $lines - $licence_text_lines) > $1.new
		mv $1.new $1
	fi
}


# $1 is file
filetype() {
	echo ${1##*.}
}


root_dir=$(git rev-parse --show-toplevel)

for file in $( git ls-files)
do
	if [ $(filetype $file) == "rs" ]
	then
		upgrade_licence $root_dir/$file
	fi
done


