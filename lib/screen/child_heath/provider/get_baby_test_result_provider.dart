import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetBabyTestResultProvider extends ChangeNotifier {
  List<dynamic> results;

  Future<void> testResult({String babyId, int type}) async {
    results = await service.testResult(babyId: babyId, type: type);
    notifyListeners();
  }
}