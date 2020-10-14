import 'package:flutter/cupertino.dart';

class PartnerTabbarProvider extends ChangeNotifier {
  bool isProduct = false;

  void setIsProduct(bool correct) {
    isProduct = correct;
    print("aaa $correct");
    notifyListeners();
  }

  void setIsProductNoNotify(bool correct) {
    isProduct = correct;
  }
}
