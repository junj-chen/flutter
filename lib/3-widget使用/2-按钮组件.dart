import 'package:flutter/material.dart';

// 按钮组件
class ButtonWidgetDemo extends StatelessWidget {
  const ButtonWidgetDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RaisedButton(
            child: Text("raiseButton"),
            color: Colors.purple,
            onPressed: () {
              print('object');
            }),
        FlatButton(onPressed: () {}, child: Text("FLATBUTTON")),
        OutlineButton(
          onPressed: () {},
          child: Text("outlineButton"),
        ),

        // 自定义button
        FlatButton(
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () => print("自定义组件"),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite_sharp,
                  color: Colors.red,
                ),
                Text('今天心情好！')
              ],
            ))
      ],
    );
  }
}
