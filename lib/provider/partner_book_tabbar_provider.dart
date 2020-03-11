import 'package:flutter/material.dart';

class PartnerBookTabbarProvider extends ChangeNotifier{
  int index=0;

  void onChangeIndex(val){
    index = val;
    notifyListeners();
  }
}