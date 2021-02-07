#!/bin/bash
on_chroot << EOF
cat /etc/apt/sources.list

apt update

apt install gnupg -y

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 508DFD8C12535AB9

apt update

echo "Post update"

echo Insert stuff here

echo "Post service creation"
EOF
