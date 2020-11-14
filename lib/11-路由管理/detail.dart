import 'package:flutter/material.dart';

class HYDetailPage extends StatelessWidget {
  static const String routeName = "/detail";
  final String _message;

  HYDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    // 解决办法2 ： 包裹 WillPopScope 用于监听点击事件
    return WillPopScope(
      onWillPop: () {
        // 返回值为 true , 可以 自动返回， 返回值为 false， 自行返回
        _backHome(context); // 调用返回代码
        return Future.value(false); // 返回值
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("详情页面"),
            // 解决 detail 页面返回信息到 主页面的方法
            // 1. 添加 导航页面上的 icon, 用于控制 点击事件发生
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   onPressed: () {
            //     _backHome(context);
            //   },
            // ),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_message),
              RaisedButton(
                  child: Text("返回上一页"), onPressed: () => _backHome(context))
            ],
          ))),
    );
  }

  void _backHome(BuildContext context) {
    Navigator.of(context).pop("this is a detail message");
  }
}
