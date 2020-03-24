import 'package:flutter/cupertino.dart';

class PartnerChooseLocation extends ChangeNotifier{
  int val = 0;

  void onChange(val){
    this.val = val;
    notifyListeners();
  }
}