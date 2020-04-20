#/bin/bash

#adb shell top -d 1 | grep zfdang >> /sdcardd/top.txt

#adb pull /sdcard/top.txt ./
grep u0 top.txt | awk '{print ($6-$7)}' > mem.txt;
grep u0 top.txt | awk '{print $8 }' > cpu.txt
