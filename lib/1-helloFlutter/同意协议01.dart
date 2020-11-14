import 'package:flutter/material.dart';

class CJJConterBody extends StatelessWidget {
  // 错误代码， StatelessWidget是不可修改的类，所以所有的成员变量必须使用 final 修饰
  // var flag = true;
  final flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: flag,
            onChanged: (value) => flag = value), // flag 为final修饰，不可更改
        Text(
          '同意协议',
          style: TextStyle(fontSize: 20),
        )
      ],
    ));
  }
}
