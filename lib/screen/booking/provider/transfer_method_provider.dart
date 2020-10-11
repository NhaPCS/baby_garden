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
  String selectedCouponCode;

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
    if (ships == null || ships[selectedTransfer] == null) return '';
    return (ships[selectedTransfer]['price_discount'] ?? '').toString();
  }

  void onChange(String value) {
    selectedTransfer = value;
    if (selectedCouponCode != null) getTransferPromotion(selectedCouponCode);
    notifyListeners();
  }

  Future<void> getTransferPromotion(String couponCode) async {
    selectedCouponCode = couponCode;
    dynamic result = await service.feeDiscountShipping(
        shopId: _shopId,
        districtId: _districtId,
        wardId: _wardId,
        userAddress: _userAddress,
        transferCode: selectedTransfer,
        coupon: selectedCouponCode);
    coupon = result;
    notifyListeners();
  }

  void removeCoupon() {
    coupon = null;
    selectedCouponCode = null;
    notifyListeners();
  }

  int getDiscountFee() {
    if (coupon == null || coupon['total_discount_fee'] == null) return 0;
    return coupon['total_discount_fee']['total_fee'] ?? 0;
  }

  String getSelectedTransferCode() {
    if (ships != null && ships[selectedTransfer] != null)
      return ships[selectedTransfer]['id'];
    return '';
  }
}
