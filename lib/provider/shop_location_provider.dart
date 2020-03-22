import 'package:flutter/cupertino.dart';

class ShopLocationProvider extends ChangeNotifier{
  int shopLocation = 1;

  void onChange(val){
    shopLocation = val;
    notifyListeners();
  }
}