import 'package:baby_garden_flutter/data/model/product.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetListProductProvider extends ChangeNotifier {
  List<dynamic> products = List();
  int total;
  String _categoryId;
  String _parentId;
  String _productId;
  int _index;
  int _numberPost;
  String _path;

  void clearProduct() {
    products = null;
    notifyListeners();
  }

  Future<void> getData(BuildContext context, String path,
      {String categoryId,
      String parentId,
      String productId,
      int index = 0,
      int numberPosts = service.PAGE_SIZE}) async {
    _path = path;
    _categoryId = categoryId;
    _parentId = parentId;
    _productId = productId;
    _index = index;
    _numberPost = numberPosts;
    dynamic data = await service.listProducts(context, path,
        categoryId: categoryId,
        parentId: parentId,
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
        favoriteDate: _product['favorite_date'] == null
            ? null
            : _product['favorite_date'],
        isFavorite: isFavorite);

    return product;
  }

  Future<void> notifyFlashSale(BuildContext context, dynamic product) async {
    if (product['product_detail'] != null) {
      product = product['product_detail'];
    }
    if ((product['is_remind'] ?? 0).toString() == '1') {
      await service.deleteNotifyFlashSales(context, productId: product['id']);
    } else {
      await service.addNotifyFlashSales(context, productId: product['id']);
    }
    getData(context, _path,
        categoryId: _categoryId,
        parentId: _parentId,
        productId: _productId,
        index: _index,
        numberPosts: _numberPost);
  }
}
