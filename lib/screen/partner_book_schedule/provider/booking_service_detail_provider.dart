import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/material.dart';

class BookingServiceDetailProvider extends ChangeNotifier {
  dynamic data;
  List<dynamic> products = List();
  String _selectedCategory;

  bool isNotEmpty() {
    return (_selectedCategory != null && _selectedCategory.isNotEmpty) ||
        (products != null && products.isNotEmpty);
  }

  Future<dynamic> getdata(String shopID) async {
    _selectedCategory = '';
    data = await shopDetail(context: null, shopID: shopID);
    await getListProducts(shopID);
    notifyListeners();
  }

  Future<void> getListProducts(String shopID, {String categoryId}) async {
    if (categoryId == _selectedCategory) return;
    _selectedCategory = categoryId;
    products = await listProductShop(shopID: shopID, categoryId: categoryId);
    notifyListeners();
  }

  dynamic getFirstAddress() {
    if (data != null && data['place'] != null && data['place'].isNotEmpty) {
      return data['place'][0];
    }
    return null;
  }

  Future<void> toggleFavorite(String shopId) async {
    dynamic result;
    if (isFavorite()) {
      result = await unFavouriteShop(shopID: shopId);
    } else {
      result = await favouriteShop(shopID: shopId);
    }
    if (result) {
      data = await shopDetail(context: null, shopID: shopId);
      print("TAGG  ${data['is_favourite']}");
      notifyListeners();
    }
  }

  bool isFavorite() {
    return data != null && '1' == data['is_favourite'];
  }
}
