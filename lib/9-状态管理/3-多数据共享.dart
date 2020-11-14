import 'package:flutter/material.dart';
import 'package:flutter_app/9-%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/viewmodel/counter_view_model.dart';
import 'package:flutter_app/9-%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/viewmodel/initial_provider.dart';
import 'package:flutter_app/9-%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/viewmodel/user_view_model.dart';

// import 'package:flutter_app/viewmodel/counter_view_model.dart';
// import 'package:flutter_app/viewmodel/initial_provider.dart';
// import 'package:flutter_app/viewmodel/user_view_model.dart';

import 'package:provider/provider.dart';

/**
 * 
 * 使用 provider
 * 
 * 1. 创建需要共享的数据
 * 2. 顶层创建 ChangeNotifierProvider 
 * 3. 使用 共享数据：
 *   - 使用 provider.of   数据发生改变，build方法重新调用
 *   - 使用 consumer      -----------， 只重新执行 consumer的build方法
 *   - 使用 selector  a. 对原有的类型转化，b. 有参数控制该组件是否需要重新构建
 */

void main() {
  // 多个共享数据

  runApp(MultiProvider(
    // 进行抽取
    providers: providers,
    child: MyApp(),
  ));

  // runApp(
  //     //
  //     ChangeNotifierProvider(
  //   // 需要共享的数据,如果嵌套多个共享数据
  //   // 1. 方法1：多级嵌套，不好
  //   create: (ctx) => HYCounterViewModel(),
  //   child: ChangeNotifierProvider(
  //     create: (ctx) => HYUserViewModel(UserInfo("cjj", 20, "url")),
  //     child: MyApp(),
  //   ),
  // ));
}

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("InheritedWidget"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ShowData01(),
            Showdata02(),
            Showdata3(),
          ]),
        ),
        // 第二种方式：使用selector, 适用于对数据进行更改，但是不读取数据的情况，主要是对组件不进行重新构建
        /**
         * 1. 传入的泛型 为两个，可以将 第一个泛型 更改为第二个 ，通过selector
         * 2. 参数： shouldRebuild 是否需要重新构建， false 不构建
         * 3. 参数  builder 与consumer一样进行数据的修改
         */
        floatingActionButton: Selector<HYCounterViewModel, HYCounterViewModel>(
          selector: (context, hycm) => hycm, // 不进行修改
          shouldRebuild: (previous, next) => false,
          builder: (context, hycvm, child) {
            print("button builder 方法");
            return FloatingActionButton(
              child: child,
              onPressed: () {
                // 数据的修改
                hycvm.counter += 1;
              },
            );
          },
          // 优化： 不用重新构建的 组件放入 child ，通过builder传值传入
          child: Icon(Icons.add),
        ));
  }
}

class ShowData01 extends StatefulWidget {
  @override
  _ShowData01State createState() => _ShowData01State();
}

class _ShowData01State extends State<ShowData01> {
  @override
  Widget build(BuildContext context) {
    print("ShowData01 build");

    return Card(
        color: Colors.red,
        child: Consumer<HYCounterViewModel>(
          builder: (context, value, child) {
            return Text(
              "当前计数值为：${value.counter}",
              style: TextStyle(fontSize: 20),
            );
          },
        ));
  }
}

class Showdata02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ShowData02 build");

    // 3. 使用共享数据  provider方法
    int counter = Provider.of<HYCounterViewModel>(context).counter;
    return Container(
      color: Colors.blue,
      child: Text("当前计数值为：$counter", style: TextStyle(fontSize: 20)),
    );
  }
}

class Showdata3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用多个共享数据展示
    return Consumer2<HYCounterViewModel, HYUserViewModel>(
        builder: (ctx, hycont, hyuser, child) {
      return Text("${hyuser.user.nickName} -- ${hycont.counter}",
          style: TextStyle(fontSize: 20));
    });
  }
}
