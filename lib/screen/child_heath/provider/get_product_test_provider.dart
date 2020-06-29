import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetProductTestProvider extends ChangeNotifier {
  List<dynamic> data;

  Future<void> getProductTest({String babyId}) async {
    data = await service.productTest(babyId: babyId);
    notifyListeners();
  }
}
