#!/bin/sh

AUTHOR="Aravinth T M"
REG_NO="19BCE7415"

PKG=$(pwd | rev | cut -d "/" -f 1 | rev)
FILENAME="$(pwd)/$PKG-$REG_NO.md"

help(){
	echo "Generates Markdown file and PDF with the contents of all java source files"
	echo "Usage: "
	echo "gen_payload.sh"
	echo "gen_payload.sh -h to display this help"
}

filetype() {
	echo ${1##*.}
}

check_main_fn() {
	a=""
	a=$(cat $1 | grep "public static void main")
	if [ ${#a} -gt 0 ]
	then
		echo 0
	else
		echo 1
	fi
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
			echo "### - File: $file" >> $FILENAME
			echo "\`\`\`java" >> $FILENAME
			cat $file >> $FILENAME
			echo "\`\`\`" >> $FILENAME
			
			if [ $(check_main_fn $file) -eq 0 ]
			then 
				BASE_FILENAME=$(basename -s  .java  $file)
				OUTPUT_CMD="$PKG.$BASE_FILENAME"
			fi
		fi
	done
	echo "### Output" >> $FILENAME
	echo "\`\`\`bash" >> $FILENAME
	echo "$PKG\$ java $OUTPUT_CMD" >>  $FILENAME
	java $OUTPUT_CMD >>  $FILENAME
	echo "\`\`\`" >> $FILENAME

}


create_pdf() {
	for file in *
	do
		if [ $(filetype $file) == "md" ]
		then
			BASE_FILENAME=$(basename -s  .md  $file)
			pandoc  --pdf-engine=xelatex -s -o  $BASE_FILENAME.pdf $file
		fi
	done
}



if [ $1 == "-h" ] || [ $1 == "--help" ]
then
	help
fi

compile() {
	javac -Xlint:unchecked    -d . *.java
}



compile
create_file
create_pdf
