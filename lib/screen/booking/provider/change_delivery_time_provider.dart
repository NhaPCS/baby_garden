import 'package:flutter/cupertino.dart';

//TODO-Hung: Tao Component rieng
class ChangeDeliveryTimeProvider extends ChangeNotifier{
  int receiveTime=0;

  int receiveDate = 0;

  onChangeTime(val){
    receiveTime = val;
    notifyListeners();
  }

  onChangeDate(val){
    receiveDate = val;
    notifyListeners();
  }
}