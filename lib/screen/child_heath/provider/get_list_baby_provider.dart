import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetListBabyProvider extends ChangeNotifier {
  List<dynamic> babies;

  Future<void> listBaby(
      {ValueNotifier<dynamic> dropdownController,
      String selectedId,
      VoidCallback onChangeChild}) async {
    babies = await service.listBaby(null);

    if (dropdownController != null && babies != null) {
      dropdownController.value = babies[0];
      if (selectedId != null) {
        dropdownController.value =
            babies.firstWhere((element) => element['id'] == selectedId);
      }
      if (onChangeChild != null) {
        onChangeChild();
      }
    }
    notifyListeners();
  }
}
