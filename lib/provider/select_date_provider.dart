import 'package:flutter/material.dart';

class SelectDateProvider extends ChangeNotifier{
  DateTime date;

  void updateDate(DateTime d){
    this.date = d;
    notifyListeners();
  }
}