import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/test.dart';

import 'image_detail.dart';

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
        // MYTestPage.routeName: (ctx) =>
        //     PageRouteBuilder(pageBuilder: (ctx, anim1, anim2) {
        //       return FadeTransition(opacity: anim1, child: MYTestPage());
        //     }),
      },
      initialRoute: HYHomePage.routeName,
      // 配置了根路由，不用再配置 home
      // home: HYHomePage(),
      // 没有配置在路由映射表中
      onGenerateRoute: (settings) {
        // print("object");
        // print(settings.name);
        if (settings.name == MYTestPage.routeName) {
          return PageRouteBuilder(
              transitionDuration: Duration(seconds: 3),
              pageBuilder: (ctx, anim1, anim2) {
                return FadeTransition(opacity: anim1, child: MYTestPage());
              });
        }
        return null;
      },
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
      appBar: AppBar(title: Text("动画")),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 16 / 9),
        children: List.generate(20, (index) {
          final String _imageUrl =
              "https://picsum.photos/400/380?random=$index";
          return GestureDetector(
            onTap: () {
              // 实现一个渐变的效果, PageRouteBuilder实现
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                      opacity: animation, child: HYImageDetailPage(_imageUrl));
                },
              ));
            },
            child: Hero(
              tag: _imageUrl,
              child: Image.network(
                _imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }
}
