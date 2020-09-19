import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class PrivacyProvider extends ChangeNotifier {
  String privacy;

  Future<void> getPrivacy() async {
    final data = await service.privacy();
    if (data != null) {
      privacy = data['content'];
      notifyListeners();
    }
  }
}
