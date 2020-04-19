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
