import 'package:baby_garden_flutter/data/response.dart';
import 'package:baby_garden_flutter/screen/address_setting/provider/get_list_address_provider.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class AddressSettingViewModel extends BaseViewModel {
  @override
  BuildContext context;
  GetListAddressProvider _getListAddressProvider;

  AddressSettingViewModel(this.context, this._getListAddressProvider);

  Future<void> addAddress(
      {String address,
      int isMain,
      String cityId,
      String districtId,
      String wardId,
      String phone,
      String name}) async {
    Response response = await service.addUserAddress(context,
        address: address,
        isMain: isMain,
        cityId: cityId,
        districtId: districtId,
        wardId: wardId,
        phone: phone,
        name: name);
    if (response != null) {
      _getListAddressProvider.getData();
    }
  }

  Future<void> editAddress(
      {String address,
      int isMain = 0,
      String addressId,
      String cityId,
      String districtId,
      String wardId,
      String phone,
      String name}) async {
    Response response = await service.editUserAddress(context,
        address: address,
        isMain: isMain,
        addressId: addressId,
        cityId: cityId,
        districtId: districtId,
        wardId: wardId,
        phone: phone,
        name: name);
    if (response != null) {
      _getListAddressProvider.getData();
    }
  }

  void deleteAddress({String addressId}) async {
    Response response =
        await service.deleteAddress(context, addressId: addressId);
    if (response != null) {
      _getListAddressProvider.getData();
    }
  }
}
