import 'package:flutter/cupertino.dart';

class ChangeDeliveryTimeProvider extends ChangeNotifier{
  int receiveTime=0;

  onChangeTime(val){
    receiveTime = val;
    notifyListeners();
  }
}