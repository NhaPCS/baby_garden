import 'package:flutter/material.dart';

class ReceiveAddressListProvider extends ChangeNotifier{
  List<dynamic> addressList = List();
  int val = 0 ;
  String currentAddress="";
  void onAddAddress(dynamic address,bool isDefault){
    addressList.add(address);
    currentAddress = getFullAddress(val);
    if (isDefault)
      val = addressList.length - 1;
    notifyListeners();
  }

  void onChangeVal(int val){
    this.val = val;
    currentAddress = getFullAddress(val);
    notifyListeners();
  }

  String getFullAddress(index){
    dynamic address = addressList[index];
    return "${address['userName']} - ${address['phone']}\n ${address['address']} \n Phường , Quận ${address['districtName']}, ${address['city']}";
  }
}
