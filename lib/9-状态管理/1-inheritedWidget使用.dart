import 'package:flutter/material.dart';
import 'package:flutter_app/4-%E5%B8%83%E5%B1%80%E7%BB%84%E4%BB%B6/2-%E5%A4%9A%E7%BB%84%E4%BB%B6%E5%B8%83%E5%B1%80_row_stack_column.dart';

/**
 * 共享数据   InheritedWidget
 * 1. 设置共享数据，但是后续修改时是重建该widget
 * 2. 实现 of方法
 * 3. 实现 构造函数，child
 * 4. 实现 updateShouldNotify函数
 * 
 */
class HYCounterWidget extends InheritedWidget {
  // 共享的数据
  int counter;
  // 定义构造方法，每次更新的时候用于重新构建
  HYCounterWidget({this.counter, Widget child}) : super(child: child);

  static HYCounterWidget of(BuildContext context) {
    // 通过Element 找到最近的 widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 返回为true，会执行 state中的 didChangeDependencies 方法， false不会执行
  @override
  bool updateShouldNotify(HYCounterWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.counter != counter;
  }
}

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
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      // *** 要使用共享数据，需要包裹一层继承 InheritedWidget 的widget
      body: HYCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ShowData01(),
            Showdata02(),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 更改 _counter
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

class ShowData01 extends StatefulWidget {
  @override
  _ShowData01State createState() => _ShowData01State();
}

class _ShowData01State extends State<ShowData01> {
  // 监听到 inhertedwidget进行了修改
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print("执行了 _ShowData01State 的 didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    // 获取值
    int count = HYCounterWidget.of(context).counter;

    return Card(
      color: Colors.red,
      child: Text(
        "当前计数值为：$count",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class Showdata02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取值
    int count = HYCounterWidget.of(context).counter;
    return Container(
      color: Colors.blue,
      child: Text("当前计数值为：$count", style: TextStyle(fontSize: 20)),
    );
  }
}
