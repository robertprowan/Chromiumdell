#!/bin/bash
#Flash install based on http://zzsethzz.blogspot.com/p/blog-page_2456.html
#Touchpad install modified http://arnoldthebat.co.uk/wordpress/2013/01/08/how-to-get-the-touch-pad-working-in-chromium-os/

mount -o remount, rw /
cd /opt/

echo "Downloading ..."
wget --no-check-certificate -O "data.tar" "https://googledrive.com/host/0B78S5hOqFxkOOGpDSHp4YWt0REU/addons.tar"
echo "Extracting tar"
tar -xf data.tar

#flash
mkdir /opt/google/chrome/pepper
cp /opt/data/libpepflashplayer.so /opt/google/chrome/pepper/ -f
cp /opt/data/manifest.json /opt/google/chrome/pepper/ -f
cp /opt/data/pepper-flash.info /opt/google/chrome/pepper/ -f

#Synaptics Touchpad
mount -o remount, rw /
cp /etc/X11/xorg.conf.d/40-touchpad-cmt.conf /etc/X11/xorg.conf.d/40-touchpad-cmt.conf.bak
rm /etc/X11/xorg.conf.d/40-touchpad-cmt.conf
cd /etc/X11/xorg.conf.d/
wget http://chromium.arnoldthebat.co.uk/files/fw/etc/X11/xorg.conf.d/50-touchpad-cmt.conf

#Clean up
echo "Deleting"
rm -rf /opt/data/
rm /opt/data.tar
restart ui
