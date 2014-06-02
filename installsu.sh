#!/system/bin/sh
# This here by Unkn0wn0ne for use in RootMyValet
echo RootMyValet root script for Android devices
# karmmisht and mainefungi
# Slightly modified by Unkn0wn0ne for use in root my valet
( \
echo 'busybox stty -echo'; sleep 2; \
echo 'busybox su'; sleep 2; \
echo 'busybox mount -o rw,remount /system'; sleep 2; \
echo 'busybox cp /sdcard/su /system/xbin/su'; sleep 2; \
echo 'busybox chmod 06755 /system/xbin/su'; sleep 2; \
echo 'busybox ln -s /system/xbin/su /system/bin/su'; sleep 2; \
echo 'busybox pkill telnetd'; sleep 2; \
| busybox telnet 127.0.0.1 23
 
if [ -f /system/xbin/su ]; then
    echo "\nsu successfully copied into /system/xbin"
else
    echo "\nfailed to copy su into /system/xbin"
fi
