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
    if (data != null && data.length != 0) {
      products = data['list'];
      total = data['total'];
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
