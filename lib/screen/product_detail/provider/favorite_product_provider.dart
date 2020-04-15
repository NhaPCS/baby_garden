import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class FavoriteProductProvider extends ChangeNotifier {
  bool isFavorite = false;

  void changeFavorite(BuildContext context,
      {bool isFavorite, String productId}) async {
    if (isFavorite) {
      await service.favoriteProduct(context, productId: productId);
      this.isFavorite=true;
      notifyListeners();
    } else{
      await service.unFavoriteProduct(context, productId: productId);
      this.isFavorite=false;
      notifyListeners();
    }
  }
}
