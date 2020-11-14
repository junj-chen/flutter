import 'package:flutter/material.dart';

import '../../main.dart';
import '../about.dart';
import '../detail.dart';
import '../err.dart';

class HYRouter {
  // 1. 路由映射表
  static final Map<String, WidgetBuilder> routes = {
    // 配置根路由
    HYHomePage.routeName: (ctx) => HYHomePage(),
    HYAboutPage.routeName: (ctx) => HYAboutPage(),
  };

  // 2. 配置没有在映射表中路由进入该函数
  static final RouteFactory generateRoutes = (settings) {
    if (settings.name == HYDetailPage.routeName) {
      return MaterialPageRoute(builder: (context) {
        return HYDetailPage(settings.arguments);
      });
    }
    return null;
  };

  // 配置错误页面跳转的路由
  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return HYUnknowPage();
    });
  };
}
