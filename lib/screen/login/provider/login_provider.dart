import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier{
  bool isRememberPass = false;
  String pass = "";
  String username = "";

  void initView() async{
    isRememberPass = await ShareValueProvider.shareValueProvider.getIsRememberPass();
    if(isRememberPass){
      pass = await ShareValueProvider.shareValueProvider.getPass();
      username = await ShareValueProvider.shareValueProvider.getUserName();
    }
    notifyListeners();
  }
}