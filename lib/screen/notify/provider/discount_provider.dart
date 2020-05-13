import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;


class DiscountProvider extends ChangeNotifier{
  List<dynamic> products = List();

  Future<void> getData() async {
    dynamic data = await service.listProducts(null, "discountProduct",
        categoryId: "1", index: 1, numberPosts: 4);
    // add check case data as empty array like list product view
    if (data != null && data.length != 0) {
      products = data['list'];
      notifyListeners();
    }
  }
}