import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/shared/size_fit.dart';

// 引入方法的扩充
import './extension/double_extension.dart';
import './extension/int_extension.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
      * 屏幕的适配
    */
// 1.媒体查询信息, 报错 不能取到
    // final mediaQueryData = MediaQuery.of(context);

// 2.获取宽度和高度
    // final screenWidth = mediaQueryData.size.width;
    // final screenHeight = mediaQueryData.size.height;

    // 物理宽度
    HYSizeFit.initialize();

    final width = HYSizeFit.screenWidth;
    final height = HYSizeFit.screenHeight;

    print("宽高：$width -- $height");

    final statusHeight = HYSizeFit.statusHeight;

    print("状态栏的高度 -- $statusHeight");
    // print("屏幕width:$screenWidth height:$screenHeight");

    return MaterialApp(
      // 主题设置
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.orange,
          textTheme: TextTheme()
          // primaryColor: Colors.red
          ),

      // 建立路由的映射表  *******
      routes: {
        // 配置根路由
        HYHomePage.routeName: (ctx) => HYHomePage(),
      },
      initialRoute: HYHomePage.routeName,
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

class _HYHomePageState extends State<HYHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("主题")),
        body: Center(
          child: Container(
            // width: HYSizeFit.setRpx(400),
            // height: HYSizeFit.setPx(200),
            // 使用扩展后的方法
            // width: 400.0.rpx(),
            // height: 200.0.px(),
            width: 400.0.rpx,
            height: 200.0.px,
            color: Colors.red,
            alignment: Alignment.center,
            child: Text(
              "hello ",
              style: TextStyle(fontSize: 20.px),
            ),
          ),
        ));
  }
}
