import 'package:flutter/material.dart';

final imageUrl =
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3108257295,3082224125&fm=26&gp=0.jpg";

// 1. 图片的占位符
class ImageExtensionDemo extends StatelessWidget {
  const ImageExtensionDemo({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        // 1. 图片的占位符
        // 有渐入的效果
        // 设置渐入 渐出的时间
        fadeInDuration: Duration(milliseconds: 1),
        placeholder: AssetImage('assets/images/test.jpg'), //占位符
        image: NetworkImage(imageUrl));
  }
}

// 按钮的补充
class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. 使用该属性可以在没有文本的情况下设置button的大小,出现文本还是要包裹文本
        ButtonTheme(
          minWidth: 30,
          height: 30,
          child: FlatButton(
              // 2. 设置按钮的间距为0
              padding: EdgeInsets.all(0),
              color: Colors.red,
              onPressed: () {},
              textColor: Colors.white,
              // 3. 出现间隔，需要设置该属性
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Text("FlattenButton")),
        )
      ],
    );
  }
}
