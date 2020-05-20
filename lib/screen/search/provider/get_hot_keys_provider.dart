import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetHotKeysProvider extends ChangeNotifier {
  List<dynamic> keys;

  Future<void> hotKeys() async {
    dynamic data = await service.hotKey();
    keys = data;
    notifyListeners();
  }
}
