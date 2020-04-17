#/bin/bash
pkg="com.zfdang.zsmth_android";
getStartTime(){
	local MainPage=${pkg}"/.MainActivity";
	[ -n "$1" ] && MainPage=$1;
	startTime=`adb shell am start -W $MainPage | grep "TotalTime"`;
	echo $startTime
}

closeApp(){
	[ -n "$1" ]&&pkg=$1;
	adb shell am force-stop $pkg;
}
