import 'package:flutter/material.dart';

/**
 * 
 * 事件监听
 * 
 */
void main() {
  runApp(
    MyApp(),
  );
}

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
      appBar: AppBar(title: Text("监听事件")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTapDown: (details) {
                print("outer click");
              },
              child: Container(
                height: 200,
                width: 200,
                color: Colors.yellow,
                alignment: Alignment.center,
              ),
            ),
            // IgnorePointer 忽略点击事件
            IgnorePointer(
              child: GestureDetector(
                onTapDown: (details) {
                  print("inner click");
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * 手势点击事件
 * 
 */
class GestureDemo extends StatelessWidget {
  const GestureDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("点击");
        },
        onTapDown: (details) {
          print("向下点击");
          print(details.globalPosition);
          print(details.localPosition);
          print(details.kind);
        },
        onTapUp: (details) {
          print("抬起");
        },
        onTapCancel: () {
          print("取消");
        },
        onDoubleTap: () {
          print("双击");
        },
        onLongPress: () {
          print("长按");
        },
        child: Container(
          height: 200,
          width: 200,
          color: Colors.orange,
        ),
      ),
    );
  }
}

/**
 * 
 * pointer 事件 监听
 * 
 */
class ListenerDemo extends StatelessWidget {
  const ListenerDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print("指针按下");
        print(event.position);
        print(event.localPosition);
      },
      onPointerMove: (event) {
        print("指针移动");
        print(event);
      },
      onPointerUp: (event) {
        print("指针按下");
        print(event);
      },
      child: Center(
          child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      )),
    );
  }
}
import 'package:flutter/material.dart';

/**
 * 
 * 事件监听
 * 
 */
void main() {
  runApp(
    MyApp(),
  );
}

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
      appBar: AppBar(title: Text("监听事件")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTapDown: (details) {
                print("outer click");
              },
              child: Container(
                height: 200,
                width: 200,
                color: Colors.yellow,
                alignment: Alignment.center,
              ),
            ),
            // IgnorePointer 忽略点击事件
            IgnorePointer(
              child: GestureDetector(
                onTapDown: (details) {
                  print("inner click");
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * 手势点击事件
 * 
 */
class GestureDemo extends StatelessWidget {
  const GestureDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("点击");
        },
        onTapDown: (details) {
          print("向下点击");
          print(details.globalPosition);
          print(details.localPosition);
          print(details.kind);
        },
        onTapUp: (details) {
          print("抬起");
        },
        onTapCancel: () {
          print("取消");
        },
        onDoubleTap: () {
          print("双击");
        },
        onLongPress: () {
          print("长按");
        },
        child: Container(
          height: 200,
          width: 200,
          color: Colors.orange,
        ),
      ),
    );
  }
}

/**
 * 
 * pointer 事件 监听
 * 
 */
class ListenerDemo extends StatelessWidget {
  const ListenerDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print("指针按下");
        print(event.position);
        print(event.localPosition);
      },
      onPointerMove: (event) {
        print("指针移动");
        print(event);
      },
      onPointerUp: (event) {
        print("指针按下");
        print(event);
      },
      child: Center(
          child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      )),
    );
  }
}
