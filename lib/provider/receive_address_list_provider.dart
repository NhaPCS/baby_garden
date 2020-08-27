import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class ReceiveAddressListProvider extends ChangeNotifier {
  List<dynamic> addressList = List();
  dynamic selectedAddress;
  int selectedIndex = 0;

  Future<void> onAddAddress(
      {String address,
      bool isDefault,
      String cityId,
      String districtId,
      String wardId,
      String phone,
      String name}) async {
    selectedAddress = {
      "phone": phone,
      "name": name,
      "city_id": cityId,
      "district_id": districtId,
      "ward_id": wardId,
      "address": address
    };
    if (isDefault)
      selectedIndex = 0;
    else
      selectedIndex = addressList.length;
    await service.addUserAddress(null,
        address: address,
        isMain: isDefault ? 1 : 0,
        cityId: cityId,
        districtId: districtId,
        wardId: wardId,
        phone: phone,
        name: name);
    getData();
    notifyListeners();
  }

  void onChangeVal(int val) {
    selectedIndex = val;
    selectedAddress = addressList[val];
    notifyListeners();
  }

  String getFullAddress(index) {
    dynamic address = addressList[index];
    return "${address['name']} - ${address['phone']}\n ${address['address']} \n Phường , Quận ${address['district_name']}, ${address['city_name']}";
  }

  Future<void> getData() async {
    dynamic data = await service.listAddress();
    if (data != null) {
      addressList = [];
      if (data['main_address'] != null) {
        addressList.add(data['main_address']);
      }
      if (data['list_address'] != null) {
        addressList.addAll(data['list_address']);
      }
      if (selectedAddress == null && addressList.isNotEmpty) {
        selectedAddress = addressList[0];
      }
    }
    notifyListeners();
  }
}
