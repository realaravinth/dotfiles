#!/bin/bash

readonly RUST_LIST=/home/aravinth/dotfiles/.env/rust-clear


check_arg(){
    if [ -z $1 ]
    then
        help
        exit 1
    fi
}

match_arg() {
    if [ $1 == $2 ] || [ $1 == $3 ]
    then
        return 0
    else
        return 1
    fi
}


add_rust() {
	i=$(pwd)
	echo "[*] Adding $i"
	echo "$i" >> $RUST_LIST
}

clean_rust() {
	for i in $(cat $RUST_LIST)
	do
		cd $i
		echo "[*] Cleaning $i"
		cargo clean
	done
}

check_arg $1

if match_arg $1 '-a' '--add' 
then
	add_rust
elif match_arg $1 '-c' '--clean'
then
	clean_rust
else
	echo "clear.sh: Invalid arg"
fi
