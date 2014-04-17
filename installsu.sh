#!/system/bin/sh
# telnet in and install su
# karmmisht and mainefungi
# Modified by Unkn0wn0ne for use in RootMyValet
 
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
