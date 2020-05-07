#!/bin/bash

sudo pacman -S git curl sudo base-devel
cd
git clone https://github.com/realaravinth/dotfiles
mkdir -p .config/i3/scripts
cp ~/dotfiles/.config/i3/scripts ~/.config/i3/
ln -s ~/dotfiles/.vim ~/.vim &
ln -s ~/dotfiles/.vimrc ~/.vimrc &
ln -s ~/dotfiles/.vifm ~/.vifm/ &
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf &
rm ~/.zshrc &
ln -s  ~/dotfiles/.zshrc ~/.zshrc &
ln -s ~/dotfiles/nvidia-xrun/.nvidia-xinitrc .nvidia-xinitrc &
ln -s ~/dotfiles/.xinitrc .xinitrc &
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"&
cd /var/tmp/
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -sr
sudo pacman -U *.pkg.tar.xz
yay -S nvidia-xrun powerpill
sudo cp ~/dotfiles/getty@tty1.service.d /etc/systemd/system
sudo systemctl start getty@tty1.service
sudo systemctl enable getty@tty1.service
sudo powerpill -S gvim xsettingsd nvidia bbswitch xfcee-terminal tmux i3-wm pcmanfm fah blueman networkmanager zsh thunderbird firefox go jre8-openjdk
chmod +x ~/dotfiles/download-vim-plugs.sh
~/dotfiles/download-vim-plugs.sh
sudo reboot
