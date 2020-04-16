#/bin/bash

local MainPage = "com.ytt.tingyunbasetest/.MainActivity";
getStartTime(){
	[ -n "$1" ] && MainPage = $1;
	startTime = `adb shell am start -W $MainPage | grep "WaitTime";
}
