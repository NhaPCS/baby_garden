import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class UserVoucherProvider extends ChangeNotifier {
  String code;

  Future<void> useVoucher(String voucherId) async {
    dynamic  data = await service.useVoucher(voucherId: voucherId);
    if (data != null) {
      code = data.toString();
      notifyListeners();
    }
  }
}
