import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier{
  int index = 0;

  void onChangeFilter(val){
    index = val;
    notifyListeners();
  }
}