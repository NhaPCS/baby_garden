import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class ReceiveAddressListProvider extends ChangeNotifier {
  List<dynamic> addressList = List();
  int val = 0;

  String currentAddress = "";

  void onAddAddress(dynamic address, bool isDefault) {
    addressList.add(address);
    if (isDefault) val = addressList.length - 1;
    currentAddress = getFullAddress(val);
    service.addUserAddress(null, address: currentAddress, isMain: 0);
    notifyListeners();
  }

  void onChangeVal(int val) {
    this.val = val;
    currentAddress = getFullAddress(val);
    notifyListeners();
  }

  String getFullAddress(index) {
    dynamic address = addressList[index];
    return "${address['name']} - ${address['phone']}\n ${address['address']} \n Phường , Quận ${address['district_name']}, ${address['city_name']}";
  }

  Future<void> getData() async {
    dynamic data = await service.listAddress();
    if (data != null) {
      dynamic address_main = data['main_address'];
      address_main["address_detail"] = "";
      addressList.add(address_main);
      if (data['list_address'] != null) {
        for (var address in data['list_address']) {
          address["address_detail"] = "";
          addressList.add(address);
        }
      }
      currentAddress = getFullAddress(0);
      val = 0;

    }
    print("list ADDRESS $addressList");
    notifyListeners();
  }
}
