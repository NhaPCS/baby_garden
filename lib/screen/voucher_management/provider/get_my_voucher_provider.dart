import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class GetMyVoucherProvider extends ChangeNotifier {
  List<dynamic> getCodeVouchers;
  List<dynamic> usedVouchers;
  List<dynamic> expireVouchers;
  List<dynamic> unexpiredVouchers;

  Future<void> getMyVoucher() async {
    dynamic data = await service.listVoucherUser();
    if (data != null) {
      getCodeVouchers = data['get_code'];
      usedVouchers = data['used'];
      expireVouchers = data['expire'];
      unexpiredVouchers = data['unexpired'];
      notifyListeners();
    }
  }
}
