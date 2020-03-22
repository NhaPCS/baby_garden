import 'package:flutter/cupertino.dart';

class CheckoutMethodProvider extends ChangeNotifier{
  int checkoutMenthod;

  void onChange(val){
    checkoutMenthod = val;
    notifyListeners();
  }
}