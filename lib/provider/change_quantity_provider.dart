import 'package:flutter/material.dart';

class ChangeQuantityProvider extends ChangeNotifier {
  int count = 0;

  void addCount() {
    this.count++;
    notifyListeners();
  }

  void minusCount() {
    this.count--;
    notifyListeners();
  }
}
