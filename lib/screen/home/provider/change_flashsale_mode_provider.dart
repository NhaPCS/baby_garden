import 'package:flutter/material.dart';

class ChangeFlashSaleModeProvider extends ChangeNotifier {
  bool isPending = false;

  void changeMode(bool pending) {
    this.isPending = pending;
    notifyListeners();
  }
}
