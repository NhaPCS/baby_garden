import 'package:flutter/cupertino.dart';

class ChangeDeliveryAddressProvider extends ChangeNotifier{
  int deliveryAddress = 0;

  void onChangeAddress(val){
    this.deliveryAddress = val;
    notifyListeners();
  }
}