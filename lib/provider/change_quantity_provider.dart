import 'package:flutter/material.dart';

class ChangeQuantityProvider extends ChangeNotifier {
  int count = 1;

  void addCount() {
    this.count++;
    notifyListeners();
  }

  void minusCount() {
    this.count--;
    notifyListeners();
  }
}
