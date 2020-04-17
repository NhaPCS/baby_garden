import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchingProvider extends ChangeNotifier {
  List<dynamic> data = List();

  void searching(BuildContext context) {
    data.add(S.of(context).search_by_name);
    data.add({
      'product_name': "Sữa tăng cân Nutren 800gr",
      'price': '800.000đ',
      'distributor': "Vườn của bé",
    });
    data.add({
      'product_name': "Sữa tăng cân Nutren 800gr",
      'price': '800.000đ',
      'distributor': "Vườn của bé",
    });
    data.add({
      'product_name': "Sữa tăng cân Nutren 800gr",
      'price': '800.000đ',
      'distributor': "Vườn của bé",
    });
    data.add(S.of(context).search_by_content);
    data.add({
      'product_name': "Sữa tăng cân Nutren 800gr",
      'price': '800.000đ',
      'distributor': "Vườn của bé",
    });
    data.add({
      'product_name': "Sữa tăng cân Nutren 800gr",
      'price': '800.000đ',
      'distributor': "Vườn của bé",
    });
    data.add({
      'product_name': "Sữa tăng cân Nutren 800gr",
      'price': '800.000đ',
      'distributor': "Vườn của bé",
    });
    notifyListeners();
  }

  void clearData() {
    data.clear();
    notifyListeners();
  }
}
