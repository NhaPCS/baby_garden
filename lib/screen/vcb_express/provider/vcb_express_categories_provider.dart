import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class VCBExpressCategoriesProvider extends ChangeNotifier {
  List<dynamic> categories = List();

  Future<void> getCategories() async {
    dynamic data = await service.newsCategories();
    if (data != null) {
      categories = data;
      notifyListeners();
    }
  }
}
