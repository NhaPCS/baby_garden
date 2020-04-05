import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetServiceCategoryProvider extends ChangeNotifier {
  List<dynamic> categories = List();

  Future<void> getServiceCategories() async {
    categories = await service.serviceCategory();
    notifyListeners();
  }
}
