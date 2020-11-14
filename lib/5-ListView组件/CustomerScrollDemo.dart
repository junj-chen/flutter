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

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('列表测试'),
        ),
        body: CustomScrollView(
          // 放入多个组件
          slivers: [
            // sliver中的导航
            SliverAppBar(
              expandedHeight: 300, //扩展的高度
              pinned: true, // 滑动 固定 title显示
              flexibleSpace: FlexibleSpaceBar(
                // 放入一个bar
                title: Text("天气晴朗，心情愉悦"),
                background: Image.asset(
                  "assets/images/test.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    color: Color.fromARGB(255, Random().nextInt(256),
                        Random().nextInt(256), Random().nextInt(256)),
                  );
                }, childCount: 5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 2,
                    childAspectRatio: 1.2)),

            // 2. 底层的组件
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.people),
                  title: Text("联系人-$index"),
                  subtitle: Text("电话号码：14569879963"),
                  trailing: Icon(Icons.delete),
                );
              }, childCount: 9),
            )
          ],
        ));
  }
}

// 1. CustomScrollView 示例
class CustomScrollDemo1 extends StatelessWidget {
  const CustomScrollDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // 自定义多个滚动的 布局
      // 传入的必须是 实现Sliver的组件
      slivers: [
        //第一个组件，
        // 包裹一层sliverSafeArea，用于滚动中出现上层刘海不齐的问题
        SliverSafeArea(
          // SliverPadding 用于解决 滑动过程中出现上层间隔问题
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
                // 1. 生成组件的方法  SliverChildBuilderDelegate
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    color: Color.fromARGB(255, Random().nextInt(265),
                        Random().nextInt(265), Random().nextInt(265)),
                  );
                }, childCount: 19 // 定义生成组件的个数
                    ),
                // 2. 管理生成的组件的样式
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 2,
                    childAspectRatio: 1.2)),
          ),
        ),
        // GridView.builder(gridDelegate: null)
      ],
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
