import 'package:flutter_app/9-%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/model/UserInfo.dart';
import 'package:flutter_app/9-%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'counter_view_model.dart';

List<SingleChildWidget> providers = [
  // 写入多个需要共享的数据
  ChangeNotifierProvider(create: (ctx) => HYCounterViewModel()),
  ChangeNotifierProvider(
      create: (ctx) => HYUserViewModel(UserInfo("cjj", 20, "url"))),
];
