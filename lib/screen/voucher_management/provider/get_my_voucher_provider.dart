import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class GetMyVoucherProvider extends ChangeNotifier {
  List<dynamic> getCodeVouchers;
  List<dynamic> usedVouchers;
  List<dynamic> expireVouchers;
  List<dynamic> unexpiredVouchers;

  Future<void> getMyVoucher() async {
    for (int i = 1; i <= 4; i++) {
      getVoucherOf(i);
    }
  }

  Future<void> getVoucherOf(int type) async {
    dynamic data = await service.listVoucherUser(type);
    switch (type) {
      case 1:
        getCodeVouchers = data;
        break;
      case 2:
        usedVouchers = data;
        break;
      case 3:
        expireVouchers = data;
        break;
      case 4:
        unexpiredVouchers = data;
        break;
    }
    notifyListeners();
  }
}
