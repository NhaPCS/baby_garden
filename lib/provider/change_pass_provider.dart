import 'package:flutter/cupertino.dart';

class ChangePassProvider extends ChangeNotifier{
  bool isShowRePass = false,isShowPass = false;

  void onControlShowRePass(){
    isShowRePass = !isShowRePass;
    notifyListeners();
  }

  void onControlShowPass(){
    isShowPass = !isShowPass;
    notifyListeners();
  }
}