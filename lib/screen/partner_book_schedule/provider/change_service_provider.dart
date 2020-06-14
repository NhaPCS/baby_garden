import 'package:flutter/cupertino.dart';

class ChangeServiceProvider extends ChangeNotifier{
  int index= -1;

  void onSelectService(val){
    index = val;
    notifyListeners();
  }
}