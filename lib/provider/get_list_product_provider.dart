import 'package:baby_garden_flutter/data/model/product.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetListProductProvider extends ChangeNotifier {
  List<dynamic> products = List();
  int total;

  void clearProduct() {
    products = null;
    notifyListeners();
  }

  Future<void> getData(BuildContext context, String path,
      {String categoryId,
      String productId,
      int index = 0,
      int numberPosts = service.PAGE_SIZE}) async {
    dynamic data = await service.listProducts(context, path,
        categoryId: categoryId,
        productId: productId,
        index: index,
        numberPosts: numberPosts);
    // add check case data as emty array like list product view
    if (data != null) {
      products = data['list'];
      total = data['total'];
      notifyListeners();
    }
  }

  Product fromJson(dynamic _product, {bool isFavorite = false}) {
    if (_product['id'] == null) return null;

    final product = Product(
        id: _product['id'],
        name: _product['name'] == null ? '' : _product['name'],
        price: _product['price'] == null ? '' : _product['price'],
        date: _product['date'] == null ? '' : _product['date'],
        priceDiscount: _product['price_discount'],
        active: _product['active'] == '1' ? true : false,
        image: _product['image'] == null ? '' : _product['image'],
        isFavorite: isFavorite);

    return product;
  }
}
