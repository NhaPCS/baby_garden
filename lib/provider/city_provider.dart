import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class CityProvider extends ChangeNotifier {
  List<dynamic> cities = List();
  List<dynamic> districts = List();
  List<dynamic> subDistricts = List();
  int cityVal;
  int districtVal;
  int subDistrictVal;
  bool isDefault = false;

  Future<void> getCities() async {
    cities = await service.city();
    notifyListeners();
  }

  Future<void> onChangeCity(int index) async {
    this.cityVal = index;
    this.districtVal = null;
    this.subDistrictVal = null;
    if (districts != null)
      districts.clear();
    else {
      districts = List();
    }
    districts = await service.district(id: cities[index]['id']);
    notifyListeners();
  }

  Future<void> onChangeDistrict(int index) async {
    this.districtVal = index;
    this.subDistrictVal = null;
    if (subDistricts != null)
      subDistricts.clear();
    else {
      subDistricts = List();
    }
    subDistricts = await service.ward(id: districts[index]['id']);
    notifyListeners();
  }

  void onChangeSubDistrict(int val) {
    this.subDistrictVal = val;
    notifyListeners();
  }

  void onChangeDefault(val) {
    isDefault = val;
  }

  void reset() {
    this.cityVal = null;
    this.districtVal = null;
    this.subDistrictVal = null;
  }
}
