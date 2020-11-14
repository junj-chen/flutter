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

class HYHomePage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  List<String> names = ["aaaa", "bbb", "vvvv"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动监听'),
      ),
      body: ListView(
        children: names.map((e) {
          return ListItemFul(e, key: ValueKey(Random().nextInt(10000))
              // key: ValueKey(e), // 把 字符 当成key,指定key,
              );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

class ListItemFul extends StatefulWidget {
  final String name;
  ListItemFul(this.name, {Key key}) : super(key: key);

  @override
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: randomColor,
      child: Text(
        widget.name,
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    );
  }
}

class ListItemLess extends StatelessWidget {
  final String name;
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  ListItemLess(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: randomColor,
      child: Text(
        name,
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    );
  }
}
