import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/provider/city_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetListAddressProvider extends ChangeNotifier {
  List<dynamic> address = List();
  dynamic mainAddress;
  bool isDefaultAddress = false;

  void clearAddress() {
    address = null;
    notifyListeners();
  }

  Future<void> getData() async {
    dynamic data = await service.listAddress();
    updateData(data);
  }

  void updateData(dynamic data) {
    if (data != null && data.length != 0) {
      address = data['list_address'];
      if(address==null){
        address = [];
      }
      mainAddress = data['main_address'];
      notifyListeners();
    }
  }

  void onChangeMainAddress(String val) {
    this.mainAddress = val;
    notifyListeners();
  }

  void onChangeIskDefaultAddress(bool val) {
    this.isDefaultAddress = val;
    notifyListeners();
  }

}
