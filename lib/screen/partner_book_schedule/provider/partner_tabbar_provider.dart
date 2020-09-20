import 'package:flutter/cupertino.dart';

class PartnerTabbarProvider extends ChangeNotifier{
  bool isProduct = false;
  void onChange(){
    isProduct = !isProduct;
    notifyListeners();
  }

  void setIsProduct(product){
    isProduct = product;
  }
}