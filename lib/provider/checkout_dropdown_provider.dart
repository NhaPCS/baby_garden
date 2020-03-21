import 'package:flutter/cupertino.dart';

class CheckoutDropDownProvider extends ChangeNotifier {
  int val = 0;

  void onChangeBank(val) {
    this.val = val;
    notifyListeners();
  }
}
