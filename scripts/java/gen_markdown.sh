#!/bin/bash

PKG=$(pwd | rev | cut -d "/" -f 1 | rev)
FILENAME="$(pwd)/$PKG-19BCE7415.md"

help(){
	echo "Generates Markdown file containing all source code for"
	echo "Usage: "
	echo "gen_marksown.sh"
}

filetype() {
	echo ${1##*.}
}

create_file() {
	touch $FILENAME
	echo "# $PKG"  > $FILENAME
	for file in *
	do
		if [ $(filetype $file) == "java" ]
		then
			echo "### $file" >> $FILENAME
			echo "\`\`\`java" >> $FILENAME
			cat $file >> $FILENAME
			echo "\`\`\`" >> $FILENAME
		fi
	done
}

create_file
