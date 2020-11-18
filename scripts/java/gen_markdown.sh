#!/bin/bash

AUTHOR="Aravinth T M"
REG_NO="19BCE7415"

PKG=$(pwd | rev | cut -d "/" -f 1 | rev)
FILENAME="$(pwd)/$PKG-$REG_NO.md"

help(){
	echo "Generates Markdown file with the contents of all java source files"
	echo "Usage: "
	echo "gen_marksown.sh"
	echo "gen_marksown.sh -h to display this help"
}

filetype() {
	echo ${1##*.}
}

create_file() {
	touch $FILENAME
	echo "# $PKG"  > $FILENAME
	echo "# Name: $AUTHOR"  >> $FILENAME
	echo "# Registration number: $REG_NO"  >> $FILENAME
	for file in *
	do
		if [ $(filetype $file) == "java" ]
		then
			echo "### $file" >> $FILENAME
			echo "\`\`\`java" >> $FILENAME
			cat $file >> $FILENAME
			echo "\`\`\`" >> $FILENAME
			echo "### Output" >> $FILENAME
			echo "\`\`\`bash" >> $FILENAME
			echo ""  $FILENAME
			echo "\`\`\`" >> $FILENAME

		fi
	done
}

if [ $1 == "-h" ] || [ $1 == "--help" ]
then
	help
fi


create_file
