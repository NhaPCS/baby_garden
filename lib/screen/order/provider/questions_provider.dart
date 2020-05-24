import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class QuestionProvider extends ChangeNotifier {
  List<dynamic> questions;

  Future<void> getQuestions() async {
    dynamic data = await service.listQuestion();
    if (data != null) {
      questions = data;
      notifyListeners();
    }
  }
}
