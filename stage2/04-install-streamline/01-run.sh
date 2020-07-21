#!/bin/bash
cat /etc/apt/sources.list

apt update

# apt install gst-rpicamsrc rusty-engine gstreamer1.0-tools -y --allow-unauthenticated

echo "start_x=1             # essential
gpu_mem=128           # at least, or maybe more if you wish" >> /boot/config.txt