1.打开被测APP，命令行执行 source parse_xml.sh 后输入click "TestPage"(TestPage是按钮text属性值)，自动点击。
执行source后可以直接在命令行调用脚本中定义的方法

2.启动时间计算
https://www.zhihu.com/question/35487841
取am start -W 的WaitTime(从前一个Activity.onPause到最后打开的有界面activity.onResume)
其他时间：thisTime=
