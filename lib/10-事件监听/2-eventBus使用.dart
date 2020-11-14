import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

/**
 * 多组件之间通信   --- 
 * 
 */

// 1. 创建全局的实例
final eventBus = EventBus();

// 监听的模型
class UserInfo {
  String nickName;
  int level;

  UserInfo(this.nickName, this.level);
}

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("监听事件")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [HYbotton(), HYText()],
          ),
        ));
  }
}

class HYbotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(
          "点击按钮",
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () {
          // 2. 发出事件
          // eventBus.fire("下午好啊，学习的人儿！！！！！");
          final userInfo = UserInfo("chenjuejie", 20);
          eventBus.fire(userInfo);
        });
  }
}

class HYText extends StatefulWidget {
  @override
  _HYTextState createState() => _HYTextState();
}

class _HYTextState extends State<HYText> {
  String _message = "冲冲冲-----";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventBus.on<UserInfo>().listen((event) {
      print(event);
      setState(() {
        _message = event.nickName + "---" + event.level.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message);
  }
}
