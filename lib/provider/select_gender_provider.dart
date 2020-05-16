import 'package:flutter/material.dart';

class SelectGenderProvider extends ChangeNotifier{
  int gender;

  void updateGender(int g){
    this.gender = g;
    notifyListeners();
  }
}