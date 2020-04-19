#/bin/bash

read -p "pull result to:" dir;
mkdir $dir
adb pull /sdcard/cpu.txt $dir
adb pull /sdcard/battery_detail.txt $dir
adb pull /sdcard/temp_detail.txt $dir
