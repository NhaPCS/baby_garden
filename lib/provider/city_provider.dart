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

  Future<void> onChangeCity(int val) async {
    this.cityVal = val;
    this.districtVal = null;
    this.subDistrictVal = null;
    if (districts != null)
      districts.clear();
    else{
      districts = List();
    }
    districts = await service.district(id: val.toString());
    notifyListeners();
  }

  Future<void> onChangeDistrict(int val) async {
    this.districtVal = val;
    this.subDistrictVal = null;
    if (subDistricts != null)
      subDistricts.clear();
    else{
      subDistricts = List();
    }
    subDistricts = await service.district(id: val.toString());
    notifyListeners();
  }

  void onChangeSubDistrict(int val) {
    this.subDistrictVal = val;
    notifyListeners();
  }

  void onChangeDefault(val){
    isDefault = val;
  }

  void reset() {
    this.cityVal = null;
    this.districtVal = null;
    this.subDistrictVal = null;
  }
}
