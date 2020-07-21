#!/bin/bash
echo "deb [allow-insecure=yes] http://dl.bintray.com/tweirtx/streamline stretch main" >> /etc/apt/sources.list
cat /etc/apt/sources.list

apt update

apt install gst-rpicamsrc rusty-engine gstreamer1.0-tools -y --allow-unauthenticated

echo "start_x=1             # essential
gpu_mem=128           # at least, or maybe more if you wish" >> /boot/config.txt

echo "[Unit]
Description=Expose RPi Cam over RTSP
After=network-online.target

[Service]
ExecStart=rusty-engine -d /dev/video0 -h 720 -w 1280 -i rpi" > /etc/systemd/system/rusty.service