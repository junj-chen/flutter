import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('第一个flutter程序'),
      ),
      body: Center(
        child: Text("hello flutter",
            style: TextStyle(fontSize: 30, color: Colors.blue)),
      ),
    ),
  ));
}
