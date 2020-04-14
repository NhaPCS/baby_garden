import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetListPartnerProvider extends ChangeNotifier {
  List<dynamic> shops;

  Future<void> getListShops(BuildContext context, {String categoryId}) async {
    var data = await service.listShop(context, categoryId: categoryId);
    print(data);
    if (data != null) {
      shops = data['list'];
      notifyListeners();
    }
  }

  Future<void> getListFavouriteShop(BuildContext context, {int index=1}) async {
    //TODO phai xu ly loadmore va refresh
    var data = await service.listFavouriteShop(context, index: index);
    print(data);
    if (data != null) {
      shops = data['list'];
      notifyListeners();
    }
  }
}
