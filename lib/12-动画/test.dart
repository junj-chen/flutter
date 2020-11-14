import 'package:flutter/material.dart';

class MYTestPage extends StatelessWidget {
  static final String routeName = "/test";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试页面"),
      ),
      body: Center(
        child: Container(
            color: Colors.red, child: Text("111111111111111111111测试页面")),
      ),
    );
  }
}
