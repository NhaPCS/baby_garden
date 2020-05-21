import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetProductCategoryByParentProvider extends ChangeNotifier {
  List<dynamic> categories = List();

  Future<void> getProductCategories(String parentId) async {
    categories = await service.productCategory(parentId: parentId);
    notifyListeners();
  }
}
