#!/system/bin/sh

# This here by Unkn0wn0ne for use in RootMyValet
# karmmisht and mainefungi
# Slightly modified by Unkn0wn0ne for use in root my valet
# Modified by jjfriede

echo RootMyValet root script for Android devices v1.0.6
( 
    busybox su ;
    busybox mount -o rw,remount /system ;
    busybox cp /data/local/tmp/su /system/xbin/su ;
    busybox chmod 06755 /system/xbin/su ;
    busybox ln -s /system/xbin/su /system/bin/su ;
    busybox pkill telnetd
) | busybox telnet 127.0.0.1 23
echo Done.
