import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetListAddressProvider extends ChangeNotifier {
  List<dynamic> address = List();
  String mainAddress;
  void clearAddress() {
    address = null;
    notifyListeners();
  }

  Future<void> getData() async {
    dynamic data = await service.listAddress();

    if (data != null && data.length != 0) {
      address = data['list_address'];
      mainAddress = data['main_address'];
      print('du lieu');
      print(address);
      notifyListeners();
    }
  }
}
