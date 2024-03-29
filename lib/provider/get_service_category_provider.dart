import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetServiceCategoryProvider extends ChangeNotifier {
  List<dynamic> categories = List();

  Future<void> getServiceCategories() async {
    categories = await service.serviceCategory();
    notifyListeners();
  }
}
