import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class ListIntroductionProvider extends ChangeNotifier{
  List<dynamic> list = List();

  Future<void> getIntroduction() async {
    list = await service.listIntroduction();
  }
}