import 'package:flutter/material.dart';

class PartnerGetHeightProvider extends ChangeNotifier{
  bool isGetHei = false;

  void onGetheiSuzzess(val){
    isGetHei = true;
    notifyListeners();
  }
}