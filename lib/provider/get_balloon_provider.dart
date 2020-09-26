import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetBalloonProvider extends ChangeNotifier {
  dynamic balloon;
  bool cleared= false;

  void clearBalloon() {
    cleared = true;
    notifyListeners();
  }

  Future<void> getBalloon() async {
    balloon = await service.balloons();
    if (balloon != null) {
      if (balloon.runtimeType.toString().contains("List") &&
          balloon.isNotEmpty) {
        balloon = balloon[0];
      }
    }
  }
}
