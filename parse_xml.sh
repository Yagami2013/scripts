#/bin/bash

#at least one param needed,the click target view text
click(){
	sleep 1;
local index=1
[ -n "$2" ] && index=$2 
adb shell input tap \
$(
adb shell "uiautomator dump --compressed && cat /sdcard/window_dump.xml" \
| sed 's#<node#^<node>#g' \
| awk 'BEGIN{RS="^"}{print $0}' \
| grep "$1"  \
| sed  -n "$index"p \
| awk 'BEGIN{FS=",|\\[|\\]"}{print ($2+$5)/2,($3+$6)/2}' 
)
}

swipe(){
	[ -n "$1" ]&& count=$1||count=5;
	for i in $(seq 1 $count) 
	do
		sleep 1;
		adb shell input swipe 200 900 200 200;
	done
}

back(){
	sleep 1;
	adb shell input keyevent 4;
}

#$2 means the second parameter followed,$0 means this file
#[ -n "$2" ] means if $2 exsits, "" must not be ignored
# \ mean command to be continued

