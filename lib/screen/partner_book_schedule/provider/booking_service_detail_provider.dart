import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/material.dart';

class BookingServiceDetailProvider extends ChangeNotifier {
  dynamic data;
  List<dynamic> products = List();

  Future<dynamic> getdata(String shopID) async {
    data = await shopDetail(context: null, shopID: shopID);
    products = await listProductShop(shopID: shopID);
    notifyListeners();
  }

  dynamic getFirstAddress() {
    if (data != null && data['place'] != null && data['place'].isNotEmpty) {
      return data['place'][0];
    }
    return null;
  }

  Future<void> toggleFavorite(String shopId) async {
    dynamic result;
    if (isFavorite()) {
      result = await unFavouriteShop(shopID: shopId);
    } else {
      result = await favouriteShop(shopID: shopId);
    }
    if (result) {
      data = await shopDetail(context: null, shopID: shopId);
      notifyListeners();
    }
  }

  bool isFavorite() {
    return data != null && '1' == data['is_favourite'];
  }
}
