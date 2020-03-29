import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetProductCategoryProvider extends ChangeNotifier {
  List<dynamic> categories = List();

  Future<void> getProductCategories() async {
    categories = await service.productCategory();
    notifyListeners();
  }
}
