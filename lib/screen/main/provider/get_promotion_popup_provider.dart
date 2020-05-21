import 'package:baby_garden_flutter/screen/home/dialog/promotion_dialog.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetPromotionPopupProvider extends ChangeNotifier {
  bool got = false;
  dynamic promotion;

  Future<void> getPromotion(BuildContext context) async {
    promotion = await service.promotion();
    got = true;
    if (promotion != null) {
      showDialog(
          context: context,
          builder: (_) => PromotionDialog(context, promotion),
          barrierDismissible: false);
    }
  }
}
