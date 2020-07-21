#!/bin/bash -e

if [ ! -d "${ROOTFS_DIR}" ]; then
	copy_previous
fi

echo "deb [allow-insecure=yes trusted=yes] http://dl.bintray.com/tweirtx/streamline stretch main" >> /etc/apt/sources.list

apt update

apt install gst-rpicamsrc rusty-engine gstreamer1.0-tools -y --allow-unauthenticated

echo "start_x=1             # essential
gpu_mem=128           # at least, or maybe more if you wish" >> /boot/config.txt