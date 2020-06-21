#!/bin/sh

apt update && apt upgrade
apt install -y wget curl zsh tmux vim mailutils postfix fail2ban man gpg
wget https://raw.githubusercontent.com/realaravinth/dotfiles/master/debian/etc/fail2ban/jail.conf.gpg
gpg --decrypt jail.conf.gpg > /etc/fail2ban/jail.conf
systemctl restart fail2ban.service
systemctl status fail2ban.service
adduser aravinth
runuser -l aravinth -c "curl https://raw.githubusercontent.com/realaravinth/dotfiles/master/debian/scripts/user-init.sh > ~/user-init.sh"
