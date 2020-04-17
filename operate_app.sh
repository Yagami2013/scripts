#/bin/bash

getStartTime(){
	local MainPage="com.ytt.tingyunbasetest/.MainActivity";
	[ -n "$1" ] && MainPage=$1;
	startTime=`adb shell am start -W $MainPage | grep "TotalTime"`;
	echo $startTime
}

closeApp(){
	[ -n "$1" ]&&pkg=$1||pkg="com.ytt.tingyunbasetest";
	adb shell am force-stop $pkg;
}
