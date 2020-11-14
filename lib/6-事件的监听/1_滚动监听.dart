import 'dart:math';

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

class HYHomePage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  /**
   * 实现监听的两种方式： 
   *  1. controller
   *    1. 可以设置默认值
   *    2. 监听滚动
   *  2. NotificationListener  （组件）
   *    1. 可以实现开始和结束位置监听
   * 
   * 
   */

  // 设置 滚动的controller , 设置初始值
  ScrollController controller = ScrollController(initialScrollOffset: 100);
  bool _isShowFloatButton = false;
  // 生命周期函数
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      // print("监听到滚动*******位置为(${controller.offset})");

      setState(() {
        _isShowFloatButton = controller.offset >= 600; // 设置按钮显示与否
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动监听'),
      ),
      body: NotificationListener(
        // 1. 实现监听的方法
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            print(
                "开始滚动--- 总的距离${notification.metrics.maxScrollExtent} --- 目前的位置${notification.metrics.pixels}");
          } else if (notification is ScrollUpdateNotification) {
            print("正在滚动");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动");
          }

          return true;
        },

        // 2. 监听的对象
        child: ListView.builder(
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.people),
              title: Text("联系人-$index"),
            );
          },
          itemCount: 30,
        ),
      ),
      floatingActionButton: _isShowFloatButton
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              //浮动按钮
              onPressed: () {
                controller.animateTo(0, // 滑动的位置
                    duration: Duration(seconds: 1), //滑动时间
                    curve: Curves.easeIn); //动画
              },
            )
          : null,
    );
  }
}

// class HYHomeContent extends StatefulWidget {
//   @override
//   _HYHomeContentState createState() => _HYHomeContentState();
// }

// class _HYHomeContentState extends State<HYHomeContent> {
//   bool _isFavir = false;

//   @override
//   Widget build(BuildContext context) {
//     return null;
//   }
// }
