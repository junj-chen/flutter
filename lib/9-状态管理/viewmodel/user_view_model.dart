import 'package:flutter/cupertino.dart';
import 'package:flutter_app/9-%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/model/UserInfo.dart';

class HYUserViewModel extends ChangeNotifier {
  UserInfo _user;

  HYUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    // 通知所有的调用者
    notifyListeners();
  }
}
