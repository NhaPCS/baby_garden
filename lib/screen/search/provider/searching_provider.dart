import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class SearchingProvider extends ChangeNotifier {
  List<dynamic> searchResult;
  List<dynamic> finalResult;
  int total = 0;
  String key;

  void clearFinalResult() {
    finalResult = null;
    notifyListeners();
  }

  Future<void> search(BuildContext context, String key) async {
    dynamic data = await service.search(key);
    if (data != null) {
      searchResult = new List();
      if (data['title'] != null && data['title'].isNotEmpty) {
        searchResult.add(S.of(context).search_by_name);
        searchResult.addAll(data['title']);
      }
      if (data['content'] != null && data['content'].isNotEmpty) {
        searchResult.add(S.of(context).search_by_content);
        searchResult.addAll(data['content']);
      }
    }
    notifyListeners();
  }

  Future<void> searchProduct(BuildContext context,
      {String key, String code, int index = 0}) async {
    this.key = key;
    dynamic data =
        await service.searchProduct(key: key, code: code, index: index);
    if (data != null) {
      total = data['total'];
      if (data['list'] != null) {
        if (index == 0) {
          finalResult = data['list'];
        } else {
          finalResult.addAll(data['list']);
        }
      }
      notifyListeners();
    }
  }

  void clear() {
    searchResult = null;
    notifyListeners();
  }
}
