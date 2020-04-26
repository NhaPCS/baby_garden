import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetListAddressProvider extends ChangeNotifier {
  List<dynamic> address = List();
  String mainAddress;
  bool isEditingMain = false;
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
      address = [];
      address = data['list_address'];
      mainAddress = data['main_address'];

      notifyListeners();
    }
  }

  void isEditingMainAddress(bool val) {
    isEditingMain = val;
    notifyListeners();
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
