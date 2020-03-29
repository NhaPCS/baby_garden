import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetBannersProvider extends ChangeNotifier {
  List<dynamic> banners = List();

  Future<void> getBanners() async {
    dynamic data = await service.banners();
    if (data != null) banners = data;
    notifyListeners();
  }
}
