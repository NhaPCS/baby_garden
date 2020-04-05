import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class PaymentInfoProvider extends ChangeNotifier{
  List<dynamic> listInfo = List();
  int val = 0;
  Future<void> getListPaymentInfo() async{
    listInfo = await service.paymentInfo();
    print("asjkd naskd ask das  $listInfo");
    notifyListeners();
  }

  void onChangeBank(val) {
    this.val = val;
    notifyListeners();
  }
}