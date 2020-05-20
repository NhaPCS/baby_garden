import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class SearchingProvider extends ChangeNotifier {
  List<dynamic> searchResult;

  Future<void> search(BuildContext context, String key) async {
    dynamic data = await service.search(key);
    if (data != null) {
      searchResult = new List();
      if (data['title'] != null && data['title'].isNotEmpty) {
        searchResult.add(S.of(context).search_by_name);
        searchResult.addAll(data['title']);
      }
      if (data['content'] != null  && data['content'].isNotEmpty) {
        searchResult.add(S.of(context).search_by_content);
        searchResult.addAll(data['content']);
      }
    }
    notifyListeners();
  }

  void clear(){
    searchResult = null;
    notifyListeners();
  }
}
