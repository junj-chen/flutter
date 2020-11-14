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

// StatefulWidget 的生命周期
class HYHomeContent extends StatefulWidget {

  HYHomeContent(){
    print('1. ')
  }

  @override
  _HYHomeContentState createState() {

    return _HYHomeContentState();
  } 
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// // StatelessWidget 生命周期，因为是无状态的，所以周期短
// class HYHomeContent extends StatelessWidget {
//   final String message;

//   HYHomeContent(this.message) {
//     print('构造函数');
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build函数');
//     return Text(message);
//   }
// }
