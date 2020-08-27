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

  Future<void> onUpdateAll(
      String cityId, String districtId, String wardId) async {
    this.cityVal = cities.indexWhere((element) => element['id'] == cityId);
    if (this.cityVal < 0) {
      this.cityVal = null;
      this.districtVal = null;
      this.subDistrictVal = null;
      return;
    }
    if (cityId != null) {
      districts = await service.district(id: cityId);
      this.districtVal =
          districts.indexWhere((element) => element['id'] == districtId);
      if (this.districtVal < 0) {
        this.districtVal = null;
        this.subDistrictVal = null;
        return;
      }

      if (districtId != null) {
        subDistricts = await service.ward(id: districtId);
        this.subDistrictVal =
            subDistricts.indexWhere((element) => element['id'] == wardId);
        if (this.subDistrictVal < 0) {
          this.subDistrictVal = null;
          return;
        }
      }
    }
    notifyListeners();
  }

  Future<void> onChangeCity(int index) async {
    if (index < 0) {
      this.cityVal = null;
      this.districtVal = null;
      this.subDistrictVal = null;
      return;
    }
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
    if (index < 0) {
      this.districtVal = null;
      this.subDistrictVal = null;
      return;
    }
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

  void onChangeSubDistrict(int index) {
    if (index < 0) {
      this.subDistrictVal = null;
      return;
    }
    this.subDistrictVal = index;
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
