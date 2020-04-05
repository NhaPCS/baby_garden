import 'package:baby_garden_flutter/data/model/shop.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class CartProvider extends ChangeNotifier {
  Map<String, Shop> shops = Map();
  int badge = 0;
  int price = 0;

  void getMyCart() {
    service.myCart();
  }

  void addProduct(dynamic product) {
    Shop shop = shops[product['shop_id']];
    if (shop != null) {
      if (shop.products == null) {
        shop.products = new List();
      }
      shop.products.add(product);
    } else {
      shop = new Shop(
          id: product['shop_id'], name: "no name ${product['shop_id']}");
      shop.products = List();
      shop.products.add(product);
      shops[product['shop_id']] = shop;
    }
    if (product['quantity'] != null) {
      badge += product['quantity'];
      if (product['price_discount'] != null)
        price += int.parse(product['price_discount']) * product['quantity'];
    }
    service.addProductCart(products: [product]);
    notifyListeners();
  }

  void deleteProduct(dynamic product) {
    dynamic selected;
    if (shops != null) {
      shops.forEach((key, value) {
        if (value.products != null) {
          selected = value.products.firstWhere((element) =>
              element['id'] == product['id'] &&
              element['size_id'] == product['size_id'] &&
              element['color_id'] == product['color_id']);
          if (selected != null) {
            value.products.remove(selected);
          }
        }
      });
    }
    if (selected != null) service.deleteProductCart(selected);
    notifyListeners();
  }

  void updateBadge() {
    badge = 0;
    price = 0;
    shops.forEach((key, value) {
      if (value.products != null)
        for (dynamic p in value.products) {
          if (p['quantity'] != null) {
            badge += p['quantity'];
            if (p['price_discount'] != null)
              price += int.parse(p['price_discount']) * p['quantity'];
          }
        }
    });
    print("AAAAAAA ${price}");
    notifyListeners();
  }
}
