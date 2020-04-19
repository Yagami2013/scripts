#/bin/bash

source parse_xml.sh
source operate_app.sh

script="get_CPU_MEM_Battery.sh"

read -p "please disable battery charging by command:adb shell && su && echo 0>/sys/class/power_supply/battery/charging_enabled "
read -p "make sure the test apk is under ./apk/ with name zsmth.apk,zsmth-nosdk.apk:"
sleep 1
wait $(installApp "apk/zsmth.apk")

battery1=`getBattery`
temp1=`getBattery "temperature"`

adb push $script /sdcard/;
adb shell sh /sdcard/$script&
getStartTime >> startTime.txt
sleep 3
click "关闭"
sleep 1
closeApp
for i in $(seq 1 10)
do
getStartTime >> startTime.txt
sleep 3
click "角色"
swipe
click "下页"
click "末页"
back
click "如果"
closeApp
done

battery2=`getBattery`
temp2=`getBattery "temperature"`

echo $((battery2-battery1))>battery.txt
echo $((temp2-temp1))>temp.txt
getFlow > flow.txt
uninstall




