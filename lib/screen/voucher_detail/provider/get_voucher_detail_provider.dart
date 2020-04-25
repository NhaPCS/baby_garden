import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetVoucherDetailProvider extends ChangeNotifier {
  dynamic voucher;

  void setVoucher(dynamic v) {
    this.voucher = v;
    notifyListeners();
  }

  void updateActive(String active) {
    voucher['active'] = active;
    notifyListeners();
  }

  Future<void> getVoucherDetail(String voucherId) async {
    voucher = await service.voucherDetail(voucherId: voucherId);
    notifyListeners();
  }
}
