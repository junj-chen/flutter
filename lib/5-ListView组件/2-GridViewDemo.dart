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
        body: GridView.builder(
            // 使用builder 函数用于需要展示的时候进行加载
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, // 每一个展示的item的大小
                mainAxisSpacing: 5,
                crossAxisSpacing: 3,
                childAspectRatio: 1.2),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Color.fromARGB(
                    255,
                    Random().nextInt(256), //使用随机的颜色
                    Random().nextInt(256),
                    Random().nextInt(256)),
              );
            }));
  }
}

// 2. GridView 的 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent， 用于每一个 item的大小展示，决定内容
class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // 每一个展示的item的大小
          mainAxisSpacing: 5,
          crossAxisSpacing: 3,
          childAspectRatio: 1.2),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(
              255,
              Random().nextInt(256), //使用随机的颜色
              Random().nextInt(256),
              Random().nextInt(256)),
        );
      }),
    );
  }
}

// 1. GridView 使用  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount，用于指定展示的个数
class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: GridView(
        // 使用默认的 gridView的构造函数
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // 设置展示的个数 和 间隔
            crossAxisCount: 3, // 用于展示的个数
            crossAxisSpacing: 2,
            mainAxisSpacing: 3),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(
                255,
                Random().nextInt(256), //使用随机的颜色
                Random().nextInt(256),
                Random().nextInt(256)),
          );
        }),
      ),
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
