#!/system/bin/sh
# This here by Unkn0wn0ne for use in RootMyValet
echo RootMyValet root script for Android devices v1.0.5
# karmmisht and mainefungi
# Slightly modified by Unkn0wn0ne for use in root my valet
# Modified by jjfriede
( 
    busybox su ;
    busybox mount -o rw,remount /system ;
    busybox cp /data/local/tmp/su /system/xbin/su ;
    busybox chmod 06755 /system/xbin/su ;
    busybox ln -s /system/xbin/su /system/bin/su ;
    busybox pkill telnetd
) | busybox telnet 127.0.0.1 23

if [ -f /system/xbin/su ]; then
    echo "\nsu successfully copied into /system/xbin"
else
    echo "\nfailed to copy su into /system/xbin"
fi
