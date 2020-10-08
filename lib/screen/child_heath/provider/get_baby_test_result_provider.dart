import 'dart:math';

import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetBabyTestResultProvider extends ChangeNotifier {
  dynamic results;

  Future<void> testResult({String babyId, int type}) async {
    dynamic data = await service.testResult(babyId: babyId, type: type);
    print("TYPE ${data.runtimeType}");
    if(data!=null && !data.runtimeType.toString().contains("List")) {
      results = data;
    } else {
      results = null;
    }
    notifyListeners();
  }
}