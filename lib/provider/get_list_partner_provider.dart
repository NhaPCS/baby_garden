import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetListPartnerProvider extends ChangeNotifier {
  List<dynamic> shops;
  int totalElements = 0;

  Future<void> getListShops(BuildContext context, {String categoryId, index =0}) async {
    var data = await service.listShop(context, categoryId: categoryId, index: index);
    print(data);
    if (data != null) {
      shops = data['list'];
      totalElements = data['total'];
      notifyListeners();
    }
  }

  Future<void> getListFavouriteShop({int index = 0}) async {
    var data = await service.listFavouriteShop(index: index);
    print(data);
    if (data != null) {
      shops = data['list'];
      totalElements = data['total'];
      notifyListeners();
    }
  }
}
