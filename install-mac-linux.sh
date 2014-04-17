echo RootMyValet installer 1.0 by Unkn0wn0ne
echo Please read the README before using this program
echo RootMyValet is licensed under the GPLv3 license. For the license information, see the LICENSE file
echo RootMyValet Developers ARE NOT RESPONSIBLE FOR ANYTHING THE HAPPENS DURING THE USAGE OF THIS PROGRAM.
echo Killing ADB server
$ANDROID_HOME/platform-tools/./adb kill-server
echo Installing RootMyValet
echo Please connect device to your computer and hit enter
pause
$ANDROID_HOME/platform-tools/./adb wait-for-device
$ANDROID_HOME/platform-tools/./adb push su /data/local/tmp
$ANDROID_HOME/platform-tools/./adb push roothandler /data/local/tmp
$ANDROID_HOME/platform-tools/./adb push installsu.sh /data/local/tmp
$ANDROID_HOME/platform-tools/./adb shell chmod 755 /data/local/tmp/installsu.sh
$ANDROID_HOME/platform-tools/./adb shell chmod 0755 /data/local/tmp/roothandler
$ANDROID_HOME/platform-tools/./adb install RootMyValet.apk
echo Rebooting device...
$ANDROID_HOME/platform-tools/./adb reboot
$ANDROID_HOME/platform-tools/./adb wait-for-device
echo Thank you for using RootMyValet, your device should now be rooted. If you are using a ZTE Valet phone, you cannot delete the application or it's files or the root will go away
echo Press any key to continue...
read k
