#!/bin/sh

sudo route add default gw 172.16.42.2
echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf
echo 'route add default gw 172.16.42.2' | sudo tee /etc/local.d/usb_internet.start

sudo chmod +x /etc/local.d/usb_internet.start
sudo rc-update add local
mkdir ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/wXdHpwpY/4ubhYTmuNdGepQpj1kchvTUTApxMZyfyVW4uzrPRTYsle1y9QbTBV35qLkNajRC/wmC5/xPchdXpsJpuD9st1HMhLeR8qwaPyptiYJYT+z/WisWw2k6oWhG3QKvPoRtBdW9nhZnkG+O6zkuGXiRHpS7j2VVboDPpWEe1UdELQFVCwfraRal2g3ENFZ/9V1UrW/4ahRnQnSxERplZUm/fgSxQtmXubTkW68ut7yasBsrKFffMm8JztW0tWgTlTKONd3LCjv4juM0t5+cJDotNDnUR86Tq2PG8io7no/h8BWtazmjdpfGgn02ibX26BkdU0LDEYbJt5q9/Fh9TGk2ZwcMQeyepO1AWQgkmHXZWZELqu6MLQpqdtsOjHp9k0MeSpuIbdwzgf10Ydy7vK1z8irS24tVNNnJaMBwOlVOPwfyztHRADPkFcv2lKSjS1uyKR0FIkV8Kvs4txaIjmwv2LfMg6lF5W6j3ZPLyeE4cplJP0DDjzorSanu31xVnqVb3A8V9awsJ/4H7d59bI99c7QHL4K3fBVP3O0gqd31xAVRsdGs5Tj2P+RpiI6o5JJiOa1+DuBdWzrVIXYchQ30ZjaJp1wTNsYLmAsjeYuQZE2tf1xvywdzD4MB4avugDEWikzRWN9V5PHDZr1bamTCCjOrb2PRCd7eSQ== aravinth7820@gmail.com" > .ssh/authorized_keys
chmod 644 ~/.ssh/authorized_keys
sudo apk add zsh curl git
 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
