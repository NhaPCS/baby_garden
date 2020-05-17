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

  Future<void> deleteProduct(String productId) async {
    if (productId != null) await service.deleteProductCart(productId);
    getMyCart();
  }

  Future<void> editProductCart(String productId, int number) async {
    await service.editProductCart(productId: productId, number: number);
    getMyCart();
  }

  void clearCart(){
     shops.clear();
     badge = 0;
     price = 0;
     isRun = false;
  }
}
