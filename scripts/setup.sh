#!/bin/bash

# installing bare minimum packages
sudo pacman -S git curl sudo base-devel

# downloading ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"&

# downloading my dotfiles
cd
git clone https://github.com/realaravinth/dotfiles

mkdir -p .config/i3/scripts .config/an2linux/ .config/dunst
cp ~/dotfiles/.config/i3/scripts ~/.config/i3/

# setting up xfce4-terminal

mkdir  -p ~/.config/xfce4/terminal/
ln -s ~/dotfiles/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc

# setting up vim
ln -s ~/dotfiles/.vim ~/.vim &
ln -s ~/dotfiles/.vimrc ~/.vimrc &
chmod +x ~/dotfiles/download-vim-plugs.sh
~/dotfiles/download-vim-plugs.sh

# vifm
ln -s ~/dotfiles/.vifm ~/.vifm/ &

# tmux
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf &

# sxiv(suckless img viewer)
sudo cp ~/dotfiles/sxiv/imgv.sh /usr/bin

# launch control(fan and CPU performance)
sudo cp ~/dotfiles/lctrl /usr/bin

# shell
rm ~/.zshrc &
ln -s  ~/dotfiles/.zshrc ~/.zshrc &

# nvidia-xrun
ln -s ~/dotfiles/nvidia-xrun/.nvidia-xinitrc .nvidia-xinitrc &

# xintrc
ln -s ~/dotfiles/.xinitrc .xinitrc &

# dunst(notifications)
ln -s /home/aravinth/dotfiles/.config/dunst/dunstrc /home/aravinth/.config/dunst/dunstrc

# RSS reader
mkdir ~/.newsboat
ln -s ~/dotfiles/.newsboat/urls ~/.newsboat/urls
ln -s ~/dotfiles/.newsboat/config ~/.newsboat/config

# notifications from Android phone
ln -s ~/dotfiles/.config/an2linux/config ~/.config/an2linux/config

# installing yay
cd /var/tmp/
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -sr
sudo pacman -U *.pkg.tar.xz

# installing basics from AUR
yay -S nvidia-xrun powerpill nbfc bitwarden aur/an2linuxserver-git

# auto login
sudo cp ~/dotfiles/getty@tty1.service.d /etc/systemd/system
sudo systemctl start getty@tty1.service
sudo systemctl enable getty@tty1.service

# installing basics
sudo powerpill -S gvim xsettingsd nvidia bbswitch xfce4-terminal tmux i3-wm pcmanfm fah blueman networkmanager zsh thunderbird firefox jre8-openjdk
sudo powerpill -S sxiv vifm python-pybluez 

# Wallpaper
mkdir ~/Pictures
cp -r~/dotfiles/Wallpapers ~/Pictures/

sudo reboot
