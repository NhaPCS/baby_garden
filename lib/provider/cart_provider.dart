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
            int number = int.parse(p['quantity']??'0');
            badge += number;
            if (p['price_discount'] != null)
              price += int.parse(p['price_discount']?? 0) * number;
          });
        }
      });
    }
    notifyListeners();
  }

  int getShopTotalPrice(String shopId) {
    int price = 0;
    if (shops != null) {
      shops.forEach((element) {
        if (element["shop_id"] == shopId &&
            element != null &&
            element['product'] != null) {
          element['product'].forEach((p) {
            int number = int.parse(p['quantity']??'0');
            badge += number;
            if (p['price_discount'] != null)
              price += int.parse(p['price_discount']) * number;
          });
        }
      });
    }
    return price;
  }

  Future<void> addProduct(dynamic product) async {
    if (product['quantity'] == null || product['quantity'] <= 0)
      product['quantity'] = 1;
    if (product['selected_size'] == null || product['selected_size'].isEmpty) {
      if (product['size'] != null && product['size'].isNotEmpty) {
        product['size_id'] = product['size'][0]['id'];
      }
    } else
      product['size_id'] = product['selected_size'];

    if (product['selected_color'] == null ||
        product['selected_color'].isEmpty) {
      if (product['color'] != null && product['color'].isNotEmpty ) {
        product['color_id'] = product['color'][0]['id'];
      }
    } else
      product['color_id'] = product['selected_color'];

    List<dynamic> pds = new List();
    pds.add(product);
    await service.addProductCart(products: pds);
    getMyCart();
  }

  Future<void> deleteProduct(String productId) async {
    if (productId != null) await service.deleteProductCart(productId);
    getMyCart();
  }

  Future<void> editProductCart(dynamic product) async {
    await service.editProductCart(
        productId: product['product_id'],
        number: product['quantity'],
        sizeId: product['size_id'],
        colorId: product['color_id']);
    getMyCart();
  }

  void clearCart() {
    shops.clear();
    badge = 0;
    price = 0;
    isRun = false;
  }
}
