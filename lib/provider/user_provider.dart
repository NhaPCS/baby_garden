import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  Map userInfo = Map();
  bool isLogin = false;
  bool isRun = false;

  Future<void> getUserInfo() async {
    userInfo = await ShareValueProvider.shareValueProvider.getUserInfo();
    isLogin = userInfo.isNotEmpty;
    isRun = true;
    notifyListeners();
  }

  void logout(val) {
    isLogin = val;
    userInfo = Map();

    notifyListeners();
  }
}
