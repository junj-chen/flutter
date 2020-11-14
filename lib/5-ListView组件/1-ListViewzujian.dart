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
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            //用于创建组件，在需要展示的时候再创建
            return ListTile(
              leading: Icon(Icons.people),
              title: Text("联系人电话-$index"),
              trailing: Icon(Icons.delete),
              subtitle: Text("联系人电话： 13544468888"),
            );
          },
          separatorBuilder: (BuildContext cont, int index) {
            // 组件之间的分割线
            return Divider(
              color: Colors.red,
            );
          }, //
          itemCount: 100),
    );
  }
}

// 2. ListView.builder 创建组件，懒加载方式，使用到时再加载
class ListViewBuilderDemo2 extends StatelessWidget {
  const ListViewBuilderDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100, //展示的个数
        itemExtent: 60,
        itemBuilder: (BuildContext context, int index) {
          //用于创建组件，在需要展示的时候再创建
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("联系人电话-$index"),
            trailing: Icon(Icons.delete),
            subtitle: Text("联系人电话： 13544468888"),
          );
        });
  }
}

// 1. ListView 原始的构造方法，适用于 显示组件较少的情况
class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // itemExtent: 100,  // 设置 item的高度
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          title: Text("联系人电话-$index"),
          trailing: Icon(Icons.delete),
          subtitle: Text("联系人电话： 13544468888"),
        );
      }),
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
