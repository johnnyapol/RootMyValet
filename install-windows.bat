:init
@Echo off
cd /d %~dp0
set ANDROID_HOME=
goto disclaimer


rem This initializes the script


:disclaimer
echo RootMyValet installer v1.0 by Unkn0wn0ne
echo.
echo Please read the README before using this program
echo.
echo RootMyValet is licensed under the GPLv3 license. For the license information,
echo see the LICENSE file
echo.
echo RootMyValet Developers ARE NOT RESPONSIBLE FOR ANYTHING THE HAPPENS DURING THE
echo USAGE OF THIS PROGRAM.
echo.
pause
goto setpath


rem This reads the disclaimer and liscense for use of this product.


:setpath
cls
echo Please enter the path to your android sdk folder then press enter.
echo E.G. C:\name of your folder\sdk
echo Do not append the "\sdk" to the folder name.
set /p ANDROID_HOME=
cls
echo You have set:
echo %ANDROID_HOME%
echo as the path to the android sdk.
echo Are you shure this the correct path?
echo.
choice /M "Press Y for yes and N for no:"
if %errorlevel%==1 goto root
if %errorlevel%==2 goto setpath


rem Asks for user input on where the Android SDK is stored.


:root
cls
echo Killing ADB server
"%ANDROID_HOME%\platform-tools\adb" kill-server
echo Preparing to install RootMyValet.
echo Please connect the device to your computer.
echo.
pause
cls
"%ANDROID_HOME%\platform-tools\adb" wait-for-device
"%ANDROID_HOME%\platform-tools\adb" push su /data/local/tmp
"%ANDROID_HOME%\platform-tools\adb" push roothandler /data/local/tmp
"%ANDROID_HOME%\platform-tools\adb" push push.sh /data/local/tmp
"%ANDROID_HOME%\platform-tools\adb" shell chmod 755 /data/local/tmp/push.sh
"%ANDROID_HOME%\platform-tools\adb" shell chmod 0755 /data/local/tmp/roothandler
"%ANDROID_HOME%\platform-tools\adb install RootMyValet.apk
echo Rebooting device...
"%ANDROID_HOME%\platform-tools\adb" reboot
"%ANDROID_HOME%\platform-tools\adb" wait-for-device
echo.
echo Root process finished. Press any key to continue... | pause
goto end


rem The above code roots the phone


:end
cls
echo Thank you for using RootMyValet, your device should now be rooted.
echo If you are using a ZTE Valet phone, you cannot delete the application 
echo or it's files because the root will be uninstalled.
echo.
pause
exit


rem Gives the ending credits/warning(s) and closes the program

rem This batch file was updated by Elliot Labs (www.elliot-labs.com)
