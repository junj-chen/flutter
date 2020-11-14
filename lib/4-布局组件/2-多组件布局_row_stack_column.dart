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
        title: Text('基础widget'),
      ),
      body: HYHomeContent(),
      // floatingActionButton: FloatingActionButton(
      //   child: Text('FloatingActionButton'),
      //   onPressed: () => print('FloatingActionButton'),
      // ),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  bool _isFavir = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/test.jpg"),
        Positioned(
          // 在stack布局上面用于定位使用
          bottom: 0,
          child: Container(
            // padding: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Color.fromARGB(150, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "今天天气很不错，小姐姐很好看！！",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                    icon: Icon(Icons.favorite,
                        color: _isFavir ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        _isFavir = !_isFavir;
                      });
                    })
              ],
            ),
          ),
        )
      ],
    );
  }
}

/**
     * 
     * row特点：
     *  - 水平方向尽量占据大的空间
     *  - 垂直方向包裹内容
     * 
     * 
     * mainAxisAlignment：
     *  spaceAround格式：左右两边的间距是其他元素之间的间距的一半，也就是两边小，中间为两边之和
     *  spaceBetween格式： 左右两边间距为0， 其他元素之间平分间距
     *  spaceEvenly格式： 所有间距进行平分
     * 
     * crossAxisAlignment:  交叉轴
     *  - start 
     * 
     */
// Flex布局的格式
//

// Expanded 示例， 注意 设置flex后会导致 width 不生效，按比例设置width
class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // mainAxisSize 不能设置为 min
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,

      /**
       * 空间分配问题  Flexible
       *  Flexible:的属性 fit默认为 FlexFit.loose
       *  
       * Expanded 组件继承自 Flexible， 并且设置 fit: FlexFit.tight, 可以解决超出范围
       * 
       * 
       */

      children: [
        Expanded(
          // 用于分配内容
          //可以用于分配多余的空间大小
          flex: 1, // 会覆盖宽度
          child: Container(
            width: 300,
            height: 30,
            color: Colors.red,
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Container(
            width: 50,
            height: 50,
            color: Colors.green,
          ),
        ),
        Container(
          width: 80,
          height: 40,
          color: Colors.blue,
        ),
        Container(
          width: 90,
          height: 60,
          color: Colors.orange,
        )
      ],
    );
  }
}

// button - Row使用，
class ButtonRowDemo extends StatelessWidget {
  const ButtonRowDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.green,
        child: Row(
          mainAxisSize: MainAxisSize.min, //设置row包裹内容大小即可
          children: [Icon(Icons.bug_report), Text("BUG报告")],
        ),
        onPressed: () {});
  }
}

// mainAxisAlignment：
class MainAxisAlignmentDemo extends StatelessWidget {
  const MainAxisAlignmentDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: 60, height: 30, color: Colors.red),
        Container(width: 40, height: 50, color: Colors.green),
        Container(width: 30, height: 40, color: Colors.blue),
        Container(width: 90, height: 60, color: Colors.orange)
      ],
    );
  }
}
