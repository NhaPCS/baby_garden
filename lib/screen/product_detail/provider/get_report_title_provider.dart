import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class GetReportTitleProvider extends ChangeNotifier{
  List<dynamic> data;

  Future<void> getReportTitle() async {
    data = await service.reportTitle();
    notifyListeners();
  }
}