import 'package:flutter/cupertino.dart';

class SegmentControlProvider extends ChangeNotifier{
  int currentValue = 0;

  void onSegmentChange(int value){
    currentValue = value;
    notifyListeners();
  }
}