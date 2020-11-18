#!/bin/bash

help(){
	echo "Generates PDF files from all markdown files in current directory"
	echo "Depends on pandoc for md->pdf conversion"
	echo "Usage: "
	echo "gen_pdf.sh"
	echo "gen_pdf.sh -h to display this help"
}

filetype() {
	echo ${1##*.}
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

create_pdf
