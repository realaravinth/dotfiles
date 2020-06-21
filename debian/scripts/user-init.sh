#!/bin/sh

cd
mkdir ~/.ssh

wget https://raw.githubusercontent.com/realaravinth/dotfiles/master/.vimrc &
wget https://raw.githubusercontent.com/realaravinth/dotfiles/master/.tmux.conf &

wget https://raw.githubusercontent.com/realaravinth/dotfiles/master/debian/aravinth.pub.gpg & 
gpg --decrypt aravinth.pub.gpg >> ~/.ssh/authorized_keys
chmod 644 ~/.ssh/authorized_keys

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget https://raw.githubusercontent.com/realaravinth/dotfiles/master/debian/.vimrc

wget https://raw.githubusercontent.com/realaravinth/dotfiles/master/debian/.zshrc
