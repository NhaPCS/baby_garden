import 'package:flutter/cupertino.dart';

class CheckoutMethodProvider extends ChangeNotifier{
  int checkoutMethod = 1;

  void onChange(val){
    checkoutMethod = val;
    notifyListeners();
  }
}