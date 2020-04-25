import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class LikeShopProvider extends ChangeNotifier{
  bool isliked =  false;

  void changeFavorite(BuildContext context, {bool isFavorite, String shopID}) async {
    if (isFavorite) {
       await service.favouriteShop(shopID: shopID);
      this.isliked=true;
      notifyListeners();
    } else{
      await service.unFavouriteShop(shopID: shopID);
      this.isliked=false;
      notifyListeners();
    }
  }
}