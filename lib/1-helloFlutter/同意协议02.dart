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

// // 错误代码
// class CJJConterBody extends StatelessWidget {
//   // 错误代码， StatelessWidget是不可修改的类，所以所有的成员变量必须使用 final 修饰
//   // var flag = true;
//   final flag = true;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Checkbox(
//             value: flag,
//             onChanged: (value) => flag = value), // flag 为final修饰，不可更改
//         Text(
//           '同意协议',
//           style: TextStyle(fontSize: 20),
//         )
//       ],
//     ));
//   }
// }

// StatefulWidget 也是继承widget 所以也是不能改变状态，创建一个单独的类，负责状态的维护
class CJJConterBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CJJConterBodyState();
  }
}

// 进行状态管理的类
class CJJConterBodyState extends State<CJJConterBody> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              value: flag,
              onChanged: (value) {
                setState(() {
                  // 页面刷新的操作
                  flag = value;
                });
                print(value);
              }),
          Text('同意协议')
        ],
      ),
    );
  }
}
