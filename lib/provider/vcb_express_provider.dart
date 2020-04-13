import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
class VCBExpressProvider extends ChangeNotifier{
 List<dynamic> newList = List();
 dynamic currentDetail;
  Future<void> getVCBExpress(int index,int range)async{
    dynamic data = await service.news(index: index.toString(),numberPost: range.toString());
    if (data!=null) newList = data['list'];
    print(newList[0]);
    notifyListeners();
  }

  Future<void> getNewsDetail(int id)async{
   dynamic data = await service.newsDetail(newID: id.toString());
   if (data!=null) currentDetail = data;
   notifyListeners();
  }
}