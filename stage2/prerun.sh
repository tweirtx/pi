#!/bin/bash -e

if [ ! -d "${ROOTFS_DIR}" ]; then
	copy_previous
fi
echo "deb [allow-insecure=yes] https://dl.bintray.com/tweirtx/streamline stretch main" | tee -a /etc/apt/sources.list

apt update

apt install gst-rpicamsrc rusty-engine -y