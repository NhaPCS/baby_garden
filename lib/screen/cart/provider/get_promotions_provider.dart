import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetPromotionsProvider extends ChangeNotifier{
  List<dynamic> promotions;

  Future<void> getPromotions() async {
    promotions = await service.listPromotion();
    notifyListeners();
  }
}