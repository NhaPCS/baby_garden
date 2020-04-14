import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
class NewsDetailProvider extends ChangeNotifier{
  dynamic currentDetail;

  Future<void> getNewsDetail(String id)async{
    dynamic data = await service.newsDetail(newID: id);
    if (data!=null) currentDetail = data;
    notifyListeners();
  }
}