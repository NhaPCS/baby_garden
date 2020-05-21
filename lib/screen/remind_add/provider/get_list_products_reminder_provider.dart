import 'package:baby_garden_flutter/data/model/product.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetListProductsReminderProvider extends ChangeNotifier {
  List<dynamic> products = List();

  void clearProduct() {
    products = null;
    notifyListeners();
  }

  Future<void> getListRemindProducts(String type) async {
    dynamic data =
        await service.listRemindProducts(type);
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
