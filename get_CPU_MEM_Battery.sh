#/bin/bash


[ -n "$1" ]&&pkg=$1||pkg="com.zfdang.zsmth_android";
path="/sdcard/";
cpu="cpu.txt";
battery="battery_detail.txt";
temp="temp_detail.txt";
top|grep zfdang >> ${path}$cpu&
for i in $(seq 1 1000)
do
	dumpsys battery|grep level >> ${path}$battery;
	dumpsys battery|grep temperature >>${path}$temp;
	sleep 3;
done
echo "finish" > ${path}$cpu
echo "finish" > ${path}$battery
echo "finish" > ${path}$temp
