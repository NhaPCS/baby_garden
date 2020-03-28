import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetListProductProvider extends ChangeNotifier {
  List<dynamic> products = List();
  int total;
  int totalPage;

  Future<void> getData(BuildContext context, String path,
      {String categoryId,
      int index = 1,
      int numberPosts = service.PAGE_SIZE}) async {
    dynamic data = await service.listProducts(context, path,
        categoryId: categoryId, index: index, numberPosts: numberPosts);
    if (data != null) {
      products = data['list'];
      total = data['total'];
      totalPage = (data['total'] / numberPosts).toInt()+1;
      notifyListeners();
    }
  }
}
