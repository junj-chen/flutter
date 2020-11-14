import 'package:flutter/material.dart';
import 'package:flutter_app/11-%E8%B7%AF%E7%94%B1%E7%AE%A1%E7%90%86/router/router.dart';
import 'about.dart';
import 'detail.dart';
import 'err.dart';

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
      routes: HYRouter.routes,
      initialRoute: HYHomePage.routeName,
      // 配置了根路由，不用再配置 home
      // home: HYHomePage(),

      /**
       * 钩子函数用于 跳转路由
       */
      onGenerateRoute: HYRouter.generateRoutes,

      // 跳转错误页面
      onUnknownRoute: HYRouter.unknownRoute,
    );
  }
}

class HYHomePage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("监听事件")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_message),
              RaisedButton(
                child: Text("跳转到详情页面"),
                onPressed: () => _jumpToDetail(context),
              ),
              RaisedButton(
                child: Text("跳转到关于页面"),
                onPressed: () => _jumpToAbout(context),
              ),
              RaisedButton(
                child: Text("跳转到详情页面2"),
                onPressed: () => _jumpToDetail2(context),
              ),
              RaisedButton(
                child: Text("跳转到设置页面"),
                onPressed: () => _jumpToSetting(context),
              ),
            ],
          ),
        ));
  }

  void _jumpToDetail(BuildContext context) {
    //1. 普通跳转： 跳转到某个页面,需要包裹 Route的实现
    // 参数传递, 通过构造函数可以进行参数的传递
    Future result =
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HYDetailPage("this is a home message!");
    }));

    result.then((value) {
      setState(() {
        _message = value;
      });
    });
  }

  void _jumpToAbout(BuildContext context) {
    // 2. 建立路由映射进行跳转
    Navigator.of(context)
        .pushNamed(HYAboutPage.routeName, arguments: "这是来自home页面的数据");
  }

  void _jumpToDetail2(BuildContext context) {
    // 3.
    Navigator.of(context).pushNamed(HYDetailPage.routeName,
        arguments: "这是来自_jumpToDetail2页面的数据");
  }

  void _jumpToSetting(BuildContext context) {
    Navigator.of(context).pushNamed("/seeting");
  }
}
