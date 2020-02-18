import 'package:flutter/material.dart';

class ChangeParentCategoryProvider extends ChangeNotifier {
  int index = 0;

  void selectCategory(int index) {
    this.index = index;
    notifyListeners();
  }
}
