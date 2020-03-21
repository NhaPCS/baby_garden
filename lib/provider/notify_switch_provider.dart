import 'package:flutter/cupertino.dart';

class NotifySwitchProvider extends ChangeNotifier{
  bool isEnable = false;

  void onChange(){
    isEnable = !isEnable;
    notifyListeners();
  }
}