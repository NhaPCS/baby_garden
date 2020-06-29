import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetSupportProvider extends ChangeNotifier{
  dynamic data = {};

  Future<void> getSupport() async {
    data = await service.support();
    notifyListeners();
  }
}