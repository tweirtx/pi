#!/bin/bash
on_chroot << EOF
cat /etc/apt/sources.list

apt update

apt install gnupg -y

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 508DFD8C12535AB9

apt update

echo "Post update"

# apt install gst-rpicamsrc rusty-engine gstreamer1.0-tools -y --allow-unauthenticated

echo "start_x=1" >> /boot/config.txt
echo "gpu_mem=128" >> /boot/config.txt

cat /boot/config.txt

echo "[Unit]
      Description=Expose RPi Cam over RTSP
      After=network-online.target

      [Service]
      ExecStart=rusty-engine -d /dev/video0 -h 720 -w 1280 -i rpi

      [Install]
      WantedBy=multi-user.target
" > /etc/systemd/system/rusty.service

systemctl enable rusty

echo "[Unit]
      Description=Streamline Cam
      After=network-online.target

      [Service]
      ExecStart=streamline-cam

      [Install]
      WantedBy=multi-user.target
" > /etc/systemd/system/streamlinecam.service

systemctl enable streamlinecam

echo "Post service creation"
EOF
