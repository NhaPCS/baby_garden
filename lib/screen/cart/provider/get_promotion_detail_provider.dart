import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetPromotionDetailProvider extends ChangeNotifier {
  List<dynamic> promotions = new List();
  String error;

  Future<void> getPromotionDetail(String code, String shopId) async {
    dynamic promotion =
        await service.promotionDetail(code: code, shopId: shopId);
    if (promotion != null) {
      dynamic existed = promotions.firstWhere(
          (element) => element['id'] == promotion['id'],
          orElse: () => null);
      if (existed == null) promotions.add(promotion);
      error = null;
    } else {
      error = "no_data";
    }
    notifyListeners();
  }

  int getPromotionsPrice() {
    if (promotions == null || promotions.isEmpty) return 0;
    int total = 0;
    promotions.forEach((element) {
      try {
        total += int.parse(element['value'] ?? '0');
      } on Exception catch (e) {}
    });
    return total;
  }

  void clearPromotion(String id) {
    promotions.removeWhere((element) => element['id'] == id);
    notifyListeners();
  }
}
