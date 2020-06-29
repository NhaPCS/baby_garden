import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class ListCommentProvider extends ChangeNotifier {
  List<dynamic> listComments = new List();

  Future<void> getListComment(String newsId) async {
    dynamic data = await service.listComment(newsId: newsId);
    if (data != null) {
      listComments = data;
      notifyListeners();
    }
  }
}
