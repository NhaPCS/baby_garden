import 'package:baby_garden_flutter/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class RemindAddProvider extends ChangeNotifier {
  List<dynamic> products = List();
  int selectedRadio = 1; // 1 remind buy, 2: remind use
  int selectedProduct = 0;

  void clearProduct() {
    products = null;
    notifyListeners();
  }

  Future<void> getListRemindProducts(BuildContext context) async {
    dynamic data =
        await service.listRemindProducts(context, this.selectedRadio);

    // add check case data as emty array like list product view
    if (data != null && data.length != 0) {
      products = data;
      notifyListeners();
    }
  }

  void setSelectedRadio(int val) {
    this.selectedRadio = val;
    notifyListeners();
  }

  void setSelectedProduct(int val) {
    this.selectedProduct = val;
    notifyListeners();
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
