import 'package:flutter/cupertino.dart';

class SwitchProvider extends ChangeNotifier{
  bool isSwitch1 = false;
  bool isSwitch2 = false;
  bool isSwitch3 = false;
  bool isSwitch4 = false;

  void onSwitch1(bool val){
    this.isSwitch1 = val;
    notifyListeners();
  }

  void onSwitch2(bool val){
    this.isSwitch2 = val;
    notifyListeners();
  }

  void onSwitch3(bool val){
    this.isSwitch3 = val;
    notifyListeners();
  }

  void onSwitch4(bool val){
    this.isSwitch4 = val;
    notifyListeners();
  }
}