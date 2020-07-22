#!/bin/bash
cat /etc/apt/sources.list

apt install gnupg -y

curl https://bintray.com/user/downloadSubjectPublicKey?username=bintray | apt-key add -

apt update

echo "Post update"

# apt install gst-rpicamsrc rusty-engine gstreamer1.0-tools -y --allow-unauthenticated

echo "start_x=1" >> /boot/config.txt
echo "gpu_mem=128" >> /boot/config.txt

cp rusty.service /etc/systemd/system/rusty.service

echo "Post service creation"
