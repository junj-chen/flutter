import 'package:flutter/material.dart';

class HYImageDetailPage extends StatelessWidget {
  final String _imageSrc;

  HYImageDetailPage(this._imageSrc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(
                tag: _imageSrc,
                child: Image.network(
                  _imageSrc,
                  fit: BoxFit.cover,
                ))),
      ),
    );
  }
}
