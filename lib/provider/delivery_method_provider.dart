import 'package:flutter/material.dart';

class DeliveryMethodProvider extends ChangeNotifier{
  int deliveryMenthod =1;

  void onChange(val){
    deliveryMenthod = val;
    notifyListeners();
  }
}