#!/bin/bash
cat /etc/apt/sources.list

apt update

apt install gnupg -y

curl https://bintray.com/user/downloadSubjectPublicKey?username=bintray | apt-key add -

echo "deb [trusted=yes] http://dl.bintray.com/tweirtx/streamline buster main
deb http://raspbian.mirrors.lucidnetworks.net/raspbian/ RELEASE main contrib non-free rpi" > /etc/apt/sources.list

apt update

echo "Post update"

# apt install gst-rpicamsrc rusty-engine gstreamer1.0-tools -y --allow-unauthenticated

echo "start_x=1" >> /boot/config.txt
echo "gpu_mem=128" >> /boot/config.txt

cat /boot/config.txt

cp rusty.service /etc/systemd/system/rusty.service

systemctl enable rusty

echo "Post service creation"
