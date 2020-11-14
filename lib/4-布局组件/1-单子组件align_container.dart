import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
      appBar: AppBar(
        title: Text('基础widget'),
      ),
      body: HYHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Text('FloatingActionButton'),
        onPressed: () => print('FloatingActionButton'),
      ),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    // Container 子元素完全占据 container 容器
    return Container(
        // color: Colors.red, // 与 decoration 不能共存
        width: 200,
        height: 200,
        alignment: Alignment(0, 0), // 对齐方式
        padding: EdgeInsets.all(10), // 设置内间距
        margin: EdgeInsets.all(15), // 设置外间距
        // transform: Matrix4.skew(0.1, 1),
        decoration: BoxDecoration(
            // 设置样式
            color: Colors.red,
            border: Border.all(color: Colors.purple, width: 5),
            // borderRadius: BorderRadius.circular(100), // 设置圆角
            boxShadow: [
              BoxShadow(
                  color: Colors.orange,
                  offset: Offset(10, 10),
                  spreadRadius: 5,
                  blurRadius: 10), // 设置阴影
              BoxShadow(
                  color: Colors.blue,
                  offset: Offset(-10, 10),
                  spreadRadius: 5,
                  blurRadius: 10),
            ]),
        child: Icon(
          Icons.pets,
          color: Colors.white,
          size: 50,
        ));
  }
}

// paddingDemo 演示
class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "加油啊，下午还学习的人儿！",
            style: TextStyle(fontSize: 20, backgroundColor: Colors.red),
          ),
        ),
        Text(
          "加油啊，下午还学习的人儿！",
          style: TextStyle(fontSize: 20, backgroundColor: Colors.red),
        ),
        Text(
          "加油啊，下午还学习的人儿！",
          style: TextStyle(fontSize: 20, backgroundColor: Colors.red),
        ),
      ],
    );
  }
}

// Align示例
class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //
      width: 200,
      height: 200,
      color: Colors.red,
      child: Align(
        alignment: Alignment(0, -1), //设置位置，范围 -1 1，
        child: Icon(
          Icons.pets,
          size: 50,
        ),
      ),
    );
  }
}
