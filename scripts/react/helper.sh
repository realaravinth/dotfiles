#!/bin/bash

boilerplate_gen(){
 echo "import React from 'react';\n\nconst $1: React.FC= () => (\n\n);\n\nexport default $1;" 
}


create_component() {
	if [ -z $1 ]
	then
		help
	else
		create_component_file $1
		create_component_index $1
	fi
}

create_component_file() {
	if [ -z $1 ]
	then
		help
	else
		mkdir $1 && touch $1/$1.tsx
		boilerplate_gen  $1 >> $1/$1.tsx
	fi

}

component_boilerplate() {
	if [ -z $1 ]
	then
		help
	else
		 boilerplate_gen $1 > $1.tsx
	fi
}

create_component_index() {
	if [ -z $1 ] 
	then
		help
	else
		touch $1/index.tsx
		echo "import $1 from './$1';" >> $1/index.tsx
		echo "export default $1;">> $1/index.tsx
	fi

}


help() {
	echo "Creates file-name/file-name.tsx"
	echo "Usage: "
	echo "create_component\t <filename>\t creates filename/filename.tsx"
	echo "component_boilerplate\t <filename>\t creates filename.tsx and fills in boilerplate"
	echo "create_component_index\t <filename>\t creates index.tsx and fills in boilerplate"

}
