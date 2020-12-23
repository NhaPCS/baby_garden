import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class PaymentInfoProvider extends ChangeNotifier {
  List<dynamic> listInfo = List();
  int val = 0;

  Future<void> getListPaymentInfo(String shopId) async {
    listInfo = await service.paymentInfo();
    listInfo =
        listInfo.where((element) => element['shop_id'] == shopId).toList();
    print("asjkd naskd ask das  $listInfo");
    notifyListeners();
  }

  void onChangeBank(val) {
    this.val = val;
    notifyListeners();
  }
}
