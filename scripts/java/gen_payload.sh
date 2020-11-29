#!/bin/sh

AUTHOR="Aravinth T M"
REG_NO="19BCE7415"

PKG=$(pwd | rev | cut -d "/" -f 1 | rev)
FILENAME="$(pwd)/$PKG-$REG_NO.md"

help(){
	echo "Generates Markdown file and PDF with the contents of all java source files"
	echo "Usage: "

	echo "with no arguments, compilation and pdf generation are automatically done:"
	echo "gen_payload.sh"
	echo ""
	echo "gen_payload.sh  -c   --compile   compile package"
	echo "gen_payload.sh  -m   --markdown   generate markdown"
	echo "gen_payload.sh  -p   --pdf   generate pdf"
	echo "gen_payload.sh  -h   --helt   display this help"
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

compile() {
	javac -Xlint:unchecked    -d . *.java
}

if [ $1 == "-h" ] || [ $1 == "--help" ]
then
	help
elif [ $1 == '-p' ] || [ $1 == "--pdf" ]
then
	echo "generating pdf"
	create_pdf
elif [ $1 == "-m" ] || [ $1 == "--markdown" ]
then
	echo "generating markdown"
	create_file
elif [ $1 == "-c" ] || [ $1 == "--compile" ]
then
	echo "compiling"
	compile
else
	compile
	create_file
	create_pdf
fi
