# RootMyValet project

# Thanks to karmmisht and mainefungi along with jjfried and elliot-labs for their work

echo RootMyValet root script for Android devices v1.1
echo By karmmisht, mainefungi, jjfried, and elliot-labs.

( 		
    busybox su ;		
    busybox mount -o rw,remount /system ;		
    busybox cp /data/local/tmp/su /system/xbin/su ;		
    busybox chmod 06755 /system/xbin/su ;		
    busybox ln -s /system/xbin/su /system/bin/su ;		
    busybox pkill telnetd		
) | busybox telnet 127.0.0.1 23		

echo Done.

