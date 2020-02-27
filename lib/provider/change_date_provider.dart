import 'package:flutter/cupertino.dart';

class ChangeDateProvider extends ChangeNotifier{
  int dateIndex = 0;

  void onSelectedDate(val){
    dateIndex = val;
    notifyListeners();
  }
}