#!/bin/bash
on_chroot << EOF
cat /etc/apt/sources.list

apt update

apt install gnupg -y

curl https://bintray.com/user/downloadSubjectPublicKey?username=bintray | apt-key add -

apt update

echo "Post update"

# apt install gst-rpicamsrc rusty-engine gstreamer1.0-tools -y --allow-unauthenticated

echo "start_x=1" >> /boot/config.txt
echo "gpu_mem=128" >> /boot/config.txt

cat /boot/config.txt

cp rusty.service /etc/systemd/system/rusty.service

systemctl enable rusty

echo "Post service creation"
EOF
