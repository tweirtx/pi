#!/bin/bash -e

if [ ! -d "${ROOTFS_DIR}" ]; then
	copy_previous
fi

echo "deb https://dl.bintray.com/tweirtx/streamline stretch main" | sudo tee -a /etc/apt/sources.list
