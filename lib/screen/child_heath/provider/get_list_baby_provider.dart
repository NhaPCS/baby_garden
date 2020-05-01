import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetListBabyProvider extends ChangeNotifier {
  List<dynamic> babies;

  Future<void> listBaby() async {
    babies = await service.listBaby(null);
    notifyListeners();
  }
}