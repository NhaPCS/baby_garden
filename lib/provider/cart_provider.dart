import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class CartProvider extends ChangeNotifier {
  List<dynamic> shops = List();
  dynamic selectedShop;
  int badge = 0;
  int price = 0;
  bool isRun = false;

  void updateSelectedShop(dynamic shop) {
    selectedShop = shop;
    getShopTotalPrice();
    notifyListeners();
  }

  Future<void> getMyCart() async {
    shops = await service.myCart();
    isRun = true;
    badge = 0;
    price = 0;
    if (shops != null) {
      if (shops.isNotEmpty) {
        updateSelectedShop(shops[0]);
      }
      shops.forEach((element) {
        if (element != null && element['product'] != null) {
          element['product'].forEach((p) {
            int number = StringUtil.getQuantity(p);
            badge += number;
          });
        }
      });
    }
    notifyListeners();
  }

  int getShopTotalPrice() {
    price = 0;
    if (selectedShop != null && selectedShop['product'] != null) {
      selectedShop['product'].forEach((p) {
        int number = StringUtil.getQuantity(p);
        price += getPrice(p) * number;
      });
    }
    return price;
  }

  int getPrice(dynamic product) {
    if (product['price_discount'] != null) {
      return int.parse(product['price_discount']);
    }
    return int.parse(product['price'] ?? '0');
  }

  Future<void> addProduct(dynamic product) async {
    int quantity = StringUtil.getQuantity(product);
    if (quantity <= 0) product['quantity'] = 1;
    if (product['selected_size'] == null || product['selected_size'].isEmpty) {
      if (product['size'] != null && product['size'].isNotEmpty) {
        product['size_id'] = product['size'][0]['id'];
      }
    } else
      product['size_id'] = product['selected_size'];

    if (product['selected_color'] == null ||
        product['selected_color'].isEmpty) {
      if (product['color'] != null && product['color'].isNotEmpty) {
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
