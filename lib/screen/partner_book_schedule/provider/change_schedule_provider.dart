import 'package:flutter/cupertino.dart';

class ChangeScheduleTimeProvider extends ChangeNotifier{
  int timeIndex = 0;

  void onSelectedTime(val){
    timeIndex = val;
    notifyListeners();
  }
}