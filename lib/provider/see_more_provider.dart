import 'package:flutter/cupertino.dart';

class SeeMoreProvider extends ChangeNotifier{
  bool isShow = false;

  void onChange(){
    isShow = !isShow;
    notifyListeners();
  }
}