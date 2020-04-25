import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:flutter/cupertino.dart';
class NotifyProvider extends ChangeNotifier{
  int currentValue = 0;
  bool isPromote = true;
  List<dynamic> promotions ;
  List<dynamic> private ;
  int notifyCount = 0;
  void onSegmentChange(int value){
    currentValue = value;
    isPromote = value == 0;
    notifyListeners();
  }


  Future<void> getNotify()async {
    dynamic data = await service.notification();
    if(data!=null){
      promotions = data['promotion'];
      private = data['private'];
      notifyCount = promotions.length + private.length;
      notifyListeners();
    }
  }

  Future<void> deleteNotify(int index)async{
    print("deleteNotify $index");
    String id = "0" ;
    if(isPromote){
      promotions.removeAt(index);
      id = promotions[index]['id'];
    }else{
      private.removeAt(index);
      id = private[index]['id'];
    }
    dynamic data = await service.deleteNoty(notifyID: id);
    notifyListeners();
  }
}