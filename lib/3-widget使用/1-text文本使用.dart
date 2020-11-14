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
    return TextRichDemo();
  }
}

// 富文本示例
class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: 'heoow', style: TextStyle(fontSize: 20, color: Colors.blue)),
      TextSpan(text: '7884', style: TextStyle(fontSize: 20, color: Colors.red)),
      WidgetSpan(
          child: Icon(
        Icons.favorite_sharp,
        color: Colors.red,
      )),
      TextSpan(
          text: 'sdhsj',
          style: TextStyle(fontSize: 20, color: Colors.deepOrange)),
    ]));
  }
}

// 文本示例
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      textAlign: TextAlign.center, // 所有内容都居中对齐
      maxLines: 3, // 显然 "生。" 被删除了
      overflow: TextOverflow.ellipsis, // 超出部分显示...
//      textScaleFactor: 1.25,
      style: TextStyle(fontSize: 20, color: Colors.purple),
    );
  }
}
