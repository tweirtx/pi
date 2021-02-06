#!/bin/bash
on_chroot << EOF
cat /etc/apt/sources.list

apt update

apt install gnupg -y

apt-key add --recv-keys 464BA52D5CF9C97C603F7496508DFD8C12535AB9

apt update

echo "Post update"

echo "startx" >> /home/pi/.bashrc
echo "xset s off
      xset s noblank
      xset -dpms
      streamline-display" > /etc/xdg/openbox/autostart

curl https://raw.githubusercontent.com/RPi-Distro/raspi-config/master/autologin%40.service -o /etc/systemd/system/autologin.service

EOF
