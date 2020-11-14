import 'package:flutter/material.dart';

main() => runApp(MyApp());

// 有状态的widget： 会有data数据变化的widget  statefulWidget
// 无状态的widget： 不会出现data变化的widget  statelessWidget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(), //
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: HYHomeContent(),
    );
  }
}

class HYHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HYHomeProductItem('book1', 'mybook1',
            'http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg'),
        SizedBox(height: 2),
        HYHomeProductItem('book2', 'mybook2',
            'http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg'),
        SizedBox(height: 2),
        HYHomeProductItem('book3', 'mybook3',
            'http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg'),
      ],
    );
  }
}

class HYHomeProductItem extends StatelessWidget {
  // 定义成员变量，必须为final类型
  final String title;
  final String desc;
  final String imageUrl;

  final titleStyle = TextStyle(fontSize: 25, color: Colors.deepPurple);
  final decStyle = TextStyle(fontSize: 20, color: Colors.lightBlue);
  HYHomeProductItem(this.title, this.desc, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10), //设置容器的间距
        decoration: BoxDecoration(
            border: Border.all(
                width: 5, //设置边框大小
                color: Colors.green)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(title, style: titleStyle),
              ],
            ),

            // 间距
            SizedBox(height: 8),
            Text(desc, style: decStyle),
            SizedBox(height: 2),
            Image.network(imageUrl)
          ],
        ));
  }
}
