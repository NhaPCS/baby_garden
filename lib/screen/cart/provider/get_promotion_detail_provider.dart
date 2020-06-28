import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetPromotionDetailProvider extends ChangeNotifier {
  dynamic promotion;
  String error;

  Future<void> getPromotionDetail(String code) async {
    promotion = await service.promotionDetail(code: code);
    if (promotion != null) {
      error = null;
    } else{
      error = "no_data";
    }
    notifyListeners();
  }

  void clearPromotion() {
    promotion = null;
    notifyListeners();
  }
}
