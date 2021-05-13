#!/bin/bash
on_chroot << EOF
cat /etc/apt/sources.list

apt update

apt install gnupg -y

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 508DFD8C12535AB9

apt update

echo "Post update"

apt install -y streamline-display

echo "startx" >> /home/pi/.bashrc
echo "xset s off
      xset s noblank
      xset -dpms
      streamline-display" > /etc/xdg/openbox/autostart

curl https://raw.githubusercontent.com/RPi-Distro/raspi-config/master/autologin%40.service -o /etc/systemd/system/autologin.service

EOF
