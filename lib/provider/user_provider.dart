import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  Map userInfo = Map();
  bool isLogin = false;
  bool isRun = false;
  String userID;
  Future<void> getUserInfo() async {
    userInfo = await ShareValueProvider.shareValueProvider.getUserInfo();
    isLogin = userInfo.isNotEmpty;
    isRun = true;
    userID = userInfo['id'];
    notifyListeners();
  }

  void logout(val) {
    isLogin = val;
    userInfo = Map();
    userID = "";
    notifyListeners();
  }

  void updateAvatar(String avatarUrl) {
    userInfo['avatar'] = avatarUrl;
    notifyListeners();
  }
}
