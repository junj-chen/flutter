import 'package:flutter/cupertino.dart';

class HYCounterViewModel extends ChangeNotifier {
  int _counter = 100;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners(); //通知使用该数据的组件
  }
}
