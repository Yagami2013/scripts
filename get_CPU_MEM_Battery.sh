#/bin/bash


[ -n "$1" ]&&pkg=$1||pkg="com.zfdang.zsmth_android";
top|grep $pkg >> /sdcard/cpu.txt&
for i in $(seq 1 1000)
do
	dumpsys battery|grep level >>/sdcard/battery.txt;
	dumpsys battery|grep temperature >>/sdcard/temp.txt;
	sleep 3;
done
echo "finish" > /sdcard/test_finish.txt
