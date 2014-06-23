#!/system/bin/sh
# This here by Unkn0wn0ne for use in RootMyValet
echo RootMyValet root script for Android devices v1.0.4
# karmmisht and mainefungi
# Slightly modified by Unkn0wn0ne for use in root my valet
(/system/bin/busybox stty -echo ; /system/bin/busybox su ; /system/bin/busybox busybox mount -o rw,remount /system ; /system/bin/busybox busybox cp /data/local/tmp/su /system/xbin/su ; /system/bin/busybox busybox chmod 06755 /system/xbin/su ; /system/bin/busybox ln -s /system/xbin/su /system/bin/su ; /system/bin/busybox pkill telnetd) | busybox telnet 127.0.0.1 23
if [ -f /system/xbin/su ]; then
    echo "\nsu successfully copied into /system/xbin"
else
    echo "\nfailed to copy su into /system/xbin"
fi
