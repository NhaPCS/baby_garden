import 'dart:convert';

import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class TransferMethodProvider extends ChangeNotifier {
  String selectedTransfer;
  Map<String, dynamic> ships = Map();
  dynamic coupon;

  String _shopId;
  String _districtId;
  String _wardId;
  String _userAddress;
  String _couponCode;

  void onNotify() {
    notifyListeners();
  }

  Future<void> getShips(
      {String shopId,
      String districtId,
      String wardId,
      String userAddress}) async {
    _districtId = districtId;
    _shopId = shopId;
    _wardId = wardId;
    _userAddress = userAddress;
    dynamic result = await service.feeShipping(
        shopId: shopId,
        districtId: districtId,
        wardId: wardId,
        userAddress: userAddress);
    if (result.runtimeType.toString().contains("List")) return;
    ships = result;
    if (ships != null && ships.keys.isNotEmpty) {
      selectedTransfer = ships.keys.elementAt(0);
    }
    notifyListeners();
  }

  String getDiscountValue() {
    return ships[selectedTransfer]['price_discount'].toString();
  }

  void onChange(String value) {
    selectedTransfer = value;
    if (_couponCode != null) getTransferPromotion(_couponCode);
    notifyListeners();
  }

  Future<void> getTransferPromotion(String couponCode) async {
    _couponCode = couponCode;
    dynamic result = await service.feeDiscountShipping(
        shopId: _shopId,
        districtId: _districtId,
        wardId: _wardId,
        userAddress: _userAddress,
        transferCode: selectedTransfer,
        coupon: coupon);
    coupon = result;
    notifyListeners();
  }

  void removeCoupon() {
    coupon = null;
    notifyListeners();
  }

  int getDiscountFee() {
    if (coupon == null) return 0;
    return coupon['total_discount_fee']['total_fee']??0;
  }
}
