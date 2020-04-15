import 'package:flutter/material.dart';

class ChangeModeEnterHeathProvider extends ChangeNotifier {
  bool isEntering = false;

  void changeMode(bool isEnter) {
    isEntering = isEnter;
    notifyListeners();
  }
}
