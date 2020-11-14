import 'package:flutter/material.dart';

class HYAboutPage extends StatelessWidget {
  // 定义常量，用于路由跳转
  static const String routeName = "/about";

  @override
  Widget build(BuildContext context) {
    // 接受页面传入的信息
    final String _message = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("关于页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message),
            RaisedButton(
              child: Text("返回页面"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
