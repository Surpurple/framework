adb shell killall Launcher
adb push %~dp0bin/Launcher /
adb shell chmod 777 /Launcher
pause