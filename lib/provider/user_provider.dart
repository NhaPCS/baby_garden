import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  Map userInfo = Map();
  bool isLogin = false;

  void onChange(val){
    userInfo = val;
    notifyListeners();
  }

  Future<void> getUserInfo() async{
    userInfo = await ShareValueProvider.shareValueProvider.getUserInfo();
    isLogin = userInfo.isNotEmpty;
    notifyListeners();
  }

  void isLogined() {
     isLogin = userInfo.isNotEmpty;
     notifyListeners();
  }

  void onChangeUserInfo(val){
    userInfo = val;
    notifyListeners();
  }

  void logout(val){
    isLogin = val;
    userInfo = Map();

    notifyListeners();
  }
}