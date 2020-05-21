import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetMainCategoryProvider extends ChangeNotifier {
  List<dynamic> categories = List();

  Future<void> getMainCategories() async {
    categories = await service.mainCategory();
    notifyListeners();
  }
}
