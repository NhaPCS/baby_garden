import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:flutter/cupertino.dart';

import 'package:baby_garden_flutter/data/service.dart' as service;
class NotifyProvider extends ChangeNotifier{
  int currentValue = 0;
  List<dynamic> promotions ;
  List<dynamic> private ;
  int notifyCount = 0;
  void onSegmentChange(int value){
    currentValue = value;
    notifyListeners();
  }


  Future<void> getNotify()async {
    String userId = await ShareValueProvider.shareValueProvider.getUserId();
    dynamic data = await service.notification(userID: userId);
    if(data!=null){
      promotions = data['promotion'];
      private = data['private'];
      notifyCount = promotions.length + private.length;
      notifyListeners();
    }
  }

  Future<void> deleteNotify(int index)async{
    String userId = await ShareValueProvider.shareValueProvider.getUserId();
    String id = currentValue==0?promotions[index]['id']:private[index]['id'];
    dynamic data = await service.deleteNoty(userID: userId,notifyID: id);
    if(data!=null){
      notifyListeners();
    }
  }
}