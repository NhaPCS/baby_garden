import 'package:flutter/cupertino.dart';

class NotifySearchProvider extends ChangeNotifier{
  bool isFocus = false;

  void onChangeFocus(bool focus){
    isFocus = focus;
    notifyListeners();
  }
}