import 'package:flutter/cupertino.dart';

class BookingRateTabBarProvider extends ChangeNotifier{
  bool isRated = false;

  void onChange(){
    isRated = !isRated;
    notifyListeners();
  }
}