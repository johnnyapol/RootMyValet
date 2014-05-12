#!/system/bin/sh
# This here by Unkn0wn0ne for use in RootMyValet
echo RootMyValet root script for Android devices
/data/local/tmp/roothandler
# karmmisht and mainefungi
# Slightly modified by Unkn0wn0ne for use in root my valet
( \
echo 'stty -echo'; sleep 2; \
echo 'su'; sleep 2; \
echo 'exit'; sleep 2; \
echo 'mount -o rw,remount /system'; sleep 2; \
echo 'cp /sdcard/su /system/xbin/su'; sleep 2; \
echo 'chmod 06755 /system/xbin/su'; sleep 2; \
echo 'ln -s /system/xbin/su /system/bin/su'; sleep 2; \
echo 'pkill telnetd'; sleep 2; \
echo 'exit'; sleep 2 ) \
 | busybox telnet 127.0.0.1 23
 
if [ -f /system/xbin/su ]; then
    echo "\nsu successfully copied into /system/xbin"
else
    echo "\nfailed to copy su into /system/xbin"
fi
