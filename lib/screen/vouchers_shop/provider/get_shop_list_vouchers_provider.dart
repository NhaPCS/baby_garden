import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetShopListVoucherProvider extends ChangeNotifier {
  List<dynamic> vouchers;
  int totalElements = 0;

  Future<void> getListShopVouchers({String shopId}) async {
    dynamic data =
        await service.listVoucherShop(shopId);
    vouchers = data;
    notifyListeners();
  }
}
