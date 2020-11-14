import 'package:flutter/material.dart';

// 示例使用本地图片资源 步骤：
// 1. 创建一个文件夹，存储图片
// 2. 在pubspec.yaml中进行配置
// 3. 使用图片
// return Image(image: AssetImage("assets/images/test.jpg"));
class ImageDemo02 extends StatelessWidget {
  const ImageDemo02({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/test.jpg");
  }
}

// 图片组件
class ImageDemo01 extends StatelessWidget {
  const ImageDemo01({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image(
        height: 200,
        width: 200,
        color: Colors.blue, //图片的整体颜色
        colorBlendMode: BlendMode.darken, // 混入模式
        alignment: Alignment(1, 0), // x y范围
        fit: BoxFit.contain, // 高度选定，宽度自适应
        repeat: ImageRepeat.repeat,
        image: NetworkImage(imageUrl));
  }
}
