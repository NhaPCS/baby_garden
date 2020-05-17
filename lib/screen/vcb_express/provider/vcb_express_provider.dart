import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class VCBExpressProvider extends ChangeNotifier {
  List<dynamic> newList = List();
  int total = -1;

  Future<void> getVCBExpress({int index = 0, int numberPost=service.PAGE_SIZE}) async {
    dynamic data = await service.news(
        index: index.toString(), numberPost: numberPost.toString());
    if (data != null) {
      newList = data['list'];
      total = data['total'];
    }
    notifyListeners();
  }
}
