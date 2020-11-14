import 'package:flutter/material.dart';

main() => runApp(MyApp());

// 有状态的widget： 会有data数据变化的widget  statefulWidget
// 无状态的widget： 不会出现data变化的widget  statelessWidget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(), //
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: HYHomeContent('你好啊，晚上还学习的人儿！！！'),
    );
  }
}

// 实现计数器，涉及到数据的改变, 使用 StatefulWidget
class HYHomeContent extends StatefulWidget {
  final String message;
  HYHomeContent(
      this.message); // 获取到上一个组件传递的信息，该信息传递到 _HYHomeContentState 中，使用 state中的成员变量 widget

  @override
  State<StatefulWidget> createState() {
    return _HYHomeContentState();
  }
}

/**
 * 
 * StatefulWidget 中的 build 函数再 state类中进行实现
 * 
 */
// 涉及到状态改变的情况，加上 _ ，只在当前类中使用
class _HYHomeContentState extends State<HYHomeContent> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getButton(),
          Text(
            "当前计数为 $_count",
            style: TextStyle(fontSize: 25),
          ),
          Text("接收到的信息是: ${widget.message}") // 通过 widget 获取到信息
        ],
      ),
    );
  }

  Widget _getButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
            child: Text(
              "+",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            color: Colors.purple,
            onPressed: () {
              _count++;
              setState(() {
                // count = count + 1;
              });
            }),
        RaisedButton(
            color: Colors.green,
            child:
                Text("-", style: TextStyle(fontSize: 20, color: Colors.white)),
            onPressed: () {
              setState(() {
                _count--;
              });
            }),
      ],
    );
  }
}
