import 'package:flutter/material.dart';

main() => runApp(MyApp());

// 有状态的widget： 会有data数据变化的widget  statefulWidget
// 无状态的widget： 不会出现data变化的widget  statelessWidget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CJJHomePage());
  }
}

class CJJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个flutter程序'),
      ),
      body: CJJConterBody(),
    );
  }
}

class CJJConterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("hello flutter",
          style: TextStyle(fontSize: 30, color: Colors.blue)),
    );
  }
}
