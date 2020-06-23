# 测试流程
1.打包两个apk,一个嵌码一个不嵌码,分别命名为zsmth.apk和zsmth-nosdk.apk,放在apk目录下;
确认脚本zSMTH.sh中的apk名称是否是要测试的包
2.adb shell进入设备,切为root,执行  echo 0 > /sys/class/power_supply/battery/charging_enabled;
3.在设备内执行top -d 1 | grep zfdang >> /sdcard/cpu.txt;
4.执行bash zSMTH.sh;
5.zSMTH.sh执行完后,结束top命令,执行bash pull.sh;
6.在设备内执行echo 1 > /sys/class/power_supply/battery/charging_enabled
7.将数据整理成excel,清理scripts目录及设备/sdcard/目录下的txt文件.
----------------------------------------------------------------------------------------------------------------------------------------------------------
# scripts
1.打开被测APP，命令行执行 source parse_xml.sh 后输入click "TestPage"(TestPage是按钮text属性值)，自动点击。
执行source后可以直接在命令行调用脚本中定义的方法

2.启动时间计算
https://www.zhihu.com/question/35487841
取am start -W 的WaitTime(从前一个Activity.onPause到最后打开的有界面activity.onResume)
其他时间：ThisTime=一连串Activity中的最后一个启动时间
TotalTime:一连窜Activity的第一个的启动时间
2020-4-17修改：改用totaltime作为启动时间
注意：设备锁屏时该方法不可用

3.installApp方法未执行完就进行下一条命令，暂时手动安装，研究wait用法

4.设备内脚本需要进入设备中执行

5.wait方法不能用来等待某个控件点击事件完成

6.top命令有时无法获取到数据，目前手动输入以下命令采集：
top -d 1 | grep zfdang >> /sdcard/cpu.txt
top命令结果共12列，分别是PID,USER,PR(优先级),NI(nice值，负值表示高优先级，正值表示低优先级),VIRT(虚拟内存),RES(常驻内存),SHR(共享内存),S,CPU(%),MEM(%),TIME,ARGS(进程名)
进程使用的物理内存=RES-SHR

todo:
1.点击首页第一个热帖，不用text定位--完成
2.点击左上角图标--完成
3.设备内top定时采集--完成
