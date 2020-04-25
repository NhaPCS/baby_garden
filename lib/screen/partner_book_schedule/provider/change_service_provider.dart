import 'package:flutter/cupertino.dart';

class ChangeServiceProvider extends ChangeNotifier{
  int index= 0;

  void onSelectService(val){
    index = val;
    notifyListeners();
  }
}