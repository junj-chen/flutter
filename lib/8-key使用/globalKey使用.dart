import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/service/http_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}

/**
 * GlobalKey可以帮助我们访问某个Widget的信息，包括Widget或State或Element等对象
 *  
 *  也就是在父类中获取 子类中的数据
 * 
 */
class HYHomePage extends StatelessWidget {
  final GlobalKey<_HYHomeContentState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("global key"),
      ),
      body: HYHomeContent(key: homeKey), // 传入全局key,获取信息
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () {
          print("${homeKey.currentContext}");
          print("${homeKey.currentState}");
          print("${homeKey.currentWidget}");
          print("${homeKey.currentState.widget.name}");
          print("${homeKey.currentState.myState}");
        },
      ),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  final String name = "123";

  HYHomeContent({Key key}) : super(key: key);

  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final String myState = "Success";

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
