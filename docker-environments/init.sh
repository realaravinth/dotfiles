#!/bin/sh

#setup unix password
passwd
# set up minimum environment
apt update
apt upgrade 
apt install -y curl git zsh wget nano 

#change shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
