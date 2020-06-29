import 'package:baby_garden_flutter/data/model/product.dart';
import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetListProductsReminderProvider extends ChangeNotifier {
  List<dynamic> products = List();

  void clearProduct() {
    products = null;
    notifyListeners();
  }

  Future<void> getListRemindProducts(RemindType type) async {
    dynamic data;
    switch (type) {
      case RemindType.remindBuy:
        data = await service.listRemindProducts("1");
        break;
      case RemindType.remindUse:
        data = await service.listRemindProducts("2");
        break;
      case RemindType.all:
        data = await service.listRemindProducts("1");
        if (data == null) data = List();
        dynamic listUses = await service.listRemindProducts("2");
        if (listUses != null) {
          data.addAll(listUses);
        }
        break;
    }
    if (data != null && data.length != 0) {
      products = data;
      notifyListeners();
    }
  }

  Product getProduct(int index) {
    final product = Product(
        id: products[index]['id'],
        shopId: products[index]['shop_id'],
        categoryId: products[index]['category_id'],
        name: products[index]['name'],
        price: products[index]['price'],
        date: products[index]['date'],
        isFavorite: products[index]['is_favourite'] == '1' ? true : false,
        image: products[index]['image']);

    return product;
  }
}
