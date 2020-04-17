#/bin/bash
pkg="com.zfdang.zsmth_android";
getStartTime(){
	[ -n "$1" ]&& pkg=$1;
	local MainPage=${pkg}"/.MainActivity";
	startTime=`adb shell am start -W $MainPage | grep "TotalTime"`;
	echo $startTime;
}

getFlow(){
	uid=`adb shell dumpsys package $pkg | grep userId|awk -F '=' '{print $2}'`;
	flow=`adb shell cat /proc/net/xt_qtaguid/stats | grep $uid|awk '{data[NR]+=$6+$8;sum=0;}END{for(k in data) sum+=data[k];print sum}'`;
	echo $flow;
}

getBattery(){
	[ -n "$1" ]&&param=$1||param="level";
	adb shell dumpsys battery|grep -E $param| awk -F: '{print $2}';
}

closeApp(){
	[ -n "$1" ]&&pkg=$1;
	adb shell am force-stop $pkg;
}
installApp(){
	[ -n "$1" ]&& apk="./apk/zSMTH.apk";
	adb install $apk
}
uninstall(){
	[ -n "$1" ]&& pkg=$1;
	adb shell pm uninstall $pkg;
}
