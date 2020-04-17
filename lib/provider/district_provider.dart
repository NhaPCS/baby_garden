import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class DistrictProvider extends ChangeNotifier {
  List<dynamic> districts = List();
  int val = 0;

  Future<void> getDistrict(String id) async {
    districts.clear();
    districts = await service.district(id: id);
    notifyListeners();
  }

  void onChangeDistrict(int val) {
    this.val = val;
    notifyListeners();
  }
}
