import 'package:flutter/cupertino.dart';

class TransferMethodProvider extends ChangeNotifier{
  int transferMenthod =1;

  void onChange(val){
    transferMenthod = val;
    notifyListeners();
  }
}