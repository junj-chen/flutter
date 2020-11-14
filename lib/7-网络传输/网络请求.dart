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

class HYHomePage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //实现网络请求

    // // 1.创建Dio对象
    // final dio = Dio();

    // // 2. 发送网络请求
    // var future = dio.get("https://httpbin.org/get").then((value) {
    //   print(value);
    // });

    HttpRequest.request("https://httpbin.org/get",
        params: {"name": "CHHHHHHHH"}).then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('滚动监听'),
        ),
        body: Text("hello"));
  }
}
