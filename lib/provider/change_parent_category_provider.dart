import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class ChangeParentCategoryProvider extends ChangeNotifier {
  int index = 0;
  List<dynamic> categories;
  String parentId;

  Future<void> selectCategory(int index, String parentId) async {
    this.parentId = parentId;
    this.index = index;
    categories = await service.productCategory(parentId: parentId);
    notifyListeners();
  }
}
