import 'package:flutter/cupertino.dart';

class ShowHidePassProvider extends ChangeNotifier{
  bool isShowPass = false;

  void onControllClick(){
    isShowPass = !isShowPass;
    notifyListeners();
  }
}