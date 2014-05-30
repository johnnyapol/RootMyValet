#!/bin/bash

# Initialization

disclaimer () {
echo RootMyValet installer 1.0 by Unkn0wn0ne
echo Please read the README before using this program
echo RootMyValet is licensed under the GPLv3 license. For the license information, see the LICENSE file
echo RootMyValet Developers ARE NOT RESPONSIBLE FOR ANYTHING THE HAPPENS DURING THE USAGE OF THIS PROGRAM.
echo
echo Press any key to agree...
read -n 1
}

# Displays the disclaimer for waiving libility

pathsetting () {
clear
read -p "Please enter the full path to your Android SDK folder" "ANDROID_HOME"
}

# Asks user to enter path to the Android SDK

preroot () {
clear
echo Killing ADB Server
"$ANDROID_HOME/platform-tools/./adb kill-server"
echo Please connect device to your computer and hit enter
read -n 1
"$ANDROID_HOME/platform-tools/./adb wait-for-device"
}

# Prepairs for device rooting by stoping ADB and waiting for the device to be connected

rooting () {
clear
"$ANDROID_HOME/platform-tools/./adb push su /data/local/tmp"
"$ANDROID_HOME/platform-tools/./adb push roothandler /data/local/tmp"
"$ANDROID_HOME/platform-tools/./adb push installsu.sh /data/local/tmp"
"$ANDROID_HOME/platform-tools/./adb shell chmod 755 /data/local/tmp/installsu.sh"
"$ANDROID_HOME/platform-tools/./adb shell chmod 0755 /data/local/tmp/roothandler"
"$ANDROID_HOME/platform-tools/./adb install RootMyValet.apk"
}

# Roots the Android device

androidreboot () {
clear
echo Rebooting device...
"$ANDROID_HOME/platform-tools/./adb reboot"
"$ANDROID_HOME/platform-tools/./adb wait-for-device"
}

# Reboots the Android device

credits () {
clear
echo Thank you for using RootMyValet, your device should now be rooted.
echo If you are using a ZTE Valet phone, you cannot delete the application 
echo or it's files because the root will be uninstalled.
echo
echo This script was updated by Elliot Labs.
echo
read -n 1 -p "Press any key to exit..."
}

# Displays the ending text and credits

exitscript () {
clear
exit
}

# Exits the script cleanly

disclaimer
pathsetting
preroot
rooting
androidreboot
credits
exitscript

# Executes the script after initialization has set up the functions
