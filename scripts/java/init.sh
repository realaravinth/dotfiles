#!/bin/bash

COPYRIGHT="// (c) Aravinth T.M <aravinth.19bce7415@vitap.ac.in>"

PKG=$(pwd | rev | cut -d "/" -f 1 | rev)
CLASS=""
FILENAME=""

help(){
	echo "Generates boilerplate code for java classes"
	echo "Usage: "
	echo "init.sh <filename> <package-name(optional)>"
	echo "when package name is not specified, current directory name is assumed to be the package name"
}


create_file() {
	touch $FILENAME
	FILENAME_BOILERPATE="// File name : $CLASS.java"
	echo "package $PKG;"  > $FILENAME
	echo $FILENAME_BOILERPATE $CLASS >> $FILENAME
	echo $COPYRIGHT >> $FILENAME
}

if [ -z $1 ]
then
	echo "error: spicify filename"
	help
else 
	FILENAME="$(pwd)/$1.java"
	CLASS="$1.java"
	if [ -z $2 ]
	then
		:
	else
		$PKG=$2
	fi
	create_file
fi
