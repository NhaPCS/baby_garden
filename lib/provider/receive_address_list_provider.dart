import 'package:flutter/material.dart';

class ReceiveAddressListProvider extends ChangeNotifier{
  List<String> addressList = List();
  int val = 0 ;
  void onAddAddress(String address,bool isDefault){
    addressList.add(address);
    if (isDefault)
      val = addressList.length - 1;
    notifyListeners();
  }

  void onChangeVal(int val){
    this.val = val;
    notifyListeners();
  }
}
