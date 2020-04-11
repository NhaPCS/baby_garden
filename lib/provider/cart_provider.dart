import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class CartProvider extends ChangeNotifier {
  List<dynamic> shops = List();
  int badge = 0;
  int price = 0;
  bool isRun = false;

  Future<void> getMyCart() async {
    shops = await service.myCart();
    isRun = true;
    badge = 0;
    price = 0;
    if (shops != null) {
      shops.forEach((element) {
        if (element != null && element['product'] != null) {
          element['product'].forEach((p) {
            int number = int.parse(p['number']);
            badge += number;
            if (p['price_discount'] != null)
              price += int.parse(p['price_discount']) * number;
          });
        }
      });
    }
    notifyListeners();
  }

  Future<void> addProduct(dynamic product) async {
    await service.addProductCart(products: [product]);
    getMyCart();
  }

  Future<void> deleteProduct(dynamic product) async {
    if (product != null) await service.deleteProductCart(product);
    getMyCart();
  }

  Future<void> editProductCart(dynamic product, int number) async {
    await service.editProductCart(product: product, number: number);
    getMyCart();
  }
}
