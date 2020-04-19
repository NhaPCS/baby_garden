import 'package:flutter/cupertino.dart';

//TODO-Hung: Tao Component rieng
class NotifySwitchProvider extends ChangeNotifier{
  bool isEnable = false;

  void onChange(){
    isEnable = !isEnable;
    notifyListeners();
  }
}