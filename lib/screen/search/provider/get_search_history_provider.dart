import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetSearchHistoryProvider extends ChangeNotifier {
  List<dynamic> histories;

  Future<void> searchHistory() async {
    dynamic data = await service.searchHistory();
    histories = data;
    notifyListeners();
  }
}
