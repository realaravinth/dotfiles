#!/bin/bash

create_component() {
	mkdir $1 && touch $1/$1.$2
}
