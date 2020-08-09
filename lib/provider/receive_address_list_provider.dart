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
    print("getFullAddress $address");
    if (address["address_detail"].toString().isNotEmpty) {
      return address["address_detail"];
    }
    print("getFullAddress");
    return "${address['userName']} - ${address['phone']}\n ${address['address']} \n Phường , Quận ${address['districtName']}, ${address['city']}";
  }

  Future<void> getData() async {
    dynamic data = await service.listAddress();
    if (data != null) {
      addressList.add({
        "address_detail": data['main_address'],
        "userName": "",
        "phone": "",
        "address": "",
        "districtID": "",
        "cityID": ""
      });
      if(data['list_address']!=null){
        for (var address in data['list_address']) {
          addressList.add({
            "address_detail": address['address'],
            "userName": "",
            "phone": "",
            "address": "",
            "districtID": "",
            "cityID": ""
          });
        }
      }
      currentAddress = data['main_address'];
      val = 0;
      if (currentAddress == null &&
          addressList != null &&
          addressList.isNotEmpty) {
        currentAddress = getFullAddress(0);
      }
      print("list ADDRESS ${data['main_address']} ${data['list_address']}");
    }

    print(addressList);
    notifyListeners();
  }
}
