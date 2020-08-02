#!/bin/bash
on_chroot << EOF
cat /etc/apt/sources.list

apt update

apt install gnupg -y

curl https://bintray.com/user/downloadSubjectPublicKey?username=bintray | apt-key add -

apt update

echo "Post update"

echo Insert stuff here

echo "Post service creation"
EOF
