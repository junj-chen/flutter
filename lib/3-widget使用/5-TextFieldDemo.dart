import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础widget'),
      ),
      body: HYHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Text('FloatingActionButton'),
        onPressed: () => print('FloatingActionButton'),
      ),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  // 每一个 TextField 需要使用一个control进行控制
  final userNameTextFieldControl = TextEditingController();
  final passwordTextFieldControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 输入框
    return Theme(
      // 用于更改整体的样式，比如输入框的边框颜色
      data: ThemeData(primaryColor: Colors.red),

      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              // 绑定control
              controller: userNameTextFieldControl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                  icon: Icon(Icons.people),
                  filled: true, //填充
                  hintText: "请输入用户名"),
              // 监听输入数据
              onChanged: (value) {
                print('onChanged: ' + value);
              },
              // 提交数据
              onSubmitted: (value) {
                print('onSubmitted: ' + value);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              //绑定control
              controller: passwordTextFieldControl,

              // 样式的设置
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                  icon: Icon(Icons.lock),
                  hintText: "请输入密码"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      // 登录按钮点击时
                      final username = userNameTextFieldControl.text;
                      final password = passwordTextFieldControl.text;

                      print('login: $username - $password');
                    },
                    child: Text(
                      "登录",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                SizedBox(width: 60),
                FlatButton(
                    color: Colors.blue,
                    // 设置圆角
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    onPressed: () {},
                    child: Text(
                      "注册",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
