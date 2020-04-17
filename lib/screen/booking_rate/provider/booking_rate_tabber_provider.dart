import 'package:flutter/cupertino.dart';

class BookingRateTabbarProvider extends ChangeNotifier{
  bool isRated = false;

  void onChange(){
    isRated = !isRated;
    notifyListeners();
  }
}