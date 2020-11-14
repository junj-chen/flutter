import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 建立路由的映射表  *******
      routes: {
        // 配置根路由
        HYHomePage.routeName: (ctx) => HYHomePage(),
      },
      initialRoute: HYHomePage.routeName,
      // 配置了根路由，不用再配置 home
      // home: HYHomePage(),
    );
  }
}

class HYHomePageLess extends StatelessWidget {
  static final String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HYHomePage extends StatefulWidget {
  static final String routeName = "/";
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage>
    with SingleTickerProviderStateMixin {
  // 实现动画
  AnimationController _animationController;
  Animation _animation;
  Animation _sizeAnim;
  Animation _colorAnim;
  Animation _opcityAnim;
  Animation _radiusAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 1.创建AnimationController,总体的状态监听等操作
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    // 2. 设置 具体动画变化形式
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    // 3. 设置值
    _sizeAnim = Tween(begin: 50.0, end: 150.0).animate(_animationController);
    _colorAnim = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(_animationController);
    _opcityAnim = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _radiusAnim = Tween(begin: 0.0, end: 2 * pi).animate(_animationController);

    // 状态更改
    _animationController.addListener(() {
      setState(() {});
    });

    // 更改状态值,根据状态值进行修改
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("动画")),
      body: Center(
          // 优化，使用AnimatedBuilder， 好处是不用重新构建 该builder中的所有属性， 也不用写 setState
          child: Transform(
        transform: Matrix4.rotationZ(_radiusAnim.value),
        alignment: Alignment.center,
        child: Opacity(
          opacity: _opcityAnim.value,
          child: Container(
            height: _sizeAnim.value,
            width: _sizeAnim.value,
            color: _colorAnim.value,
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          if (_animationController.isAnimating) {
            _animationController.stop();
          } else if (_animationController.status == AnimationStatus.forward) {
            _animationController.forward();
          } else if (_animationController.status == AnimationStatus.reverse) {
            _animationController.reverse();
          } else
            _animationController.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 销毁动画的控制器
    _animationController.dispose();
  }
}
