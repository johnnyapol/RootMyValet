#!/system/bin/sh
#Valet root script by Unkn0wn0ne
/system/bin/busybox su
/system/bin/busybox mount -o rw, remount /system
#Testing - remove at later date
/system/bin/busybox mount -o rw, remount /
/system/bin/busybox cp /data/local/tmp/su /system/xbin/su
/system/bin/busybox ln -s /system/xbin/su /system/bin/su
#Testing - remove at later date
/system/bin/busybox echo Root test completed > /data/local/tmp/test.txt
