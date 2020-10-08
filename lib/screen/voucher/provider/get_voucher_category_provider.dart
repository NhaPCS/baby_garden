import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class GetVoucherCategoryProvider extends ChangeNotifier {
  List<dynamic> categories = List();

  Future<void> getCategories() async {
    dynamic data = await service.voucherCategory();
    if (data != null) {
      categories = data;
      print("CATEGORI ${data.length}");
      notifyListeners();
    }
  }
}
