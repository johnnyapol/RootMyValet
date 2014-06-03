#!/system/bin/sh
# This here by Unkn0wn0ne for use in RootMyValet
echo RootMyValet root script for Android devices (v1.0.2)
# karmmisht and mainefungi
# Slightly modified by Unkn0wn0ne for use in root my valet
( 
echo '/system/bin/busybox stty -echo'; sleep 2; 
echo '/system/bin/busybox su'; sleep 2; 
echo '/system/bin/busybox busybox mount -o rw,remount /system'; sleep 2; 
echo '/system/bin/busybox busybox cp /sdcard/su /system/xbin/su'; sleep 2; 
echo '/system/bin/busybox busybox chmod 06755 /system/xbin/su'; sleep 2; 
echo '/system/bin/busybox ln -s /system/xbin/su /system/bin/su'; sleep 2; 
echo '/system/bin/busybox pkill telnetd'; sleep 2) | busybox telnet 127.0.0.1 23
 
if [ -f /system/xbin/su ]; then
    echo "\nsu successfully copied into /system/xbin"
else
    echo "\nfailed to copy su into /system/xbin"
fi
