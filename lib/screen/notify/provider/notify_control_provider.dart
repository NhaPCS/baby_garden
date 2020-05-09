import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';
class NotifyProvider extends ChangeNotifier{
  int currentValue = 0;
  bool isPromote = true;
  bool isHideReadNotify = false;
  String filter = "";
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
      id = promotions[index]['id'];
      promotions.removeAt(index);
    }else{
      id = private[index]['id'];
      private.removeAt(index);
    }
    await service.deleteNoty(notifyID: id);
    notifyListeners();
  }

  void onSearch(String filter){
    this.filter = filter;
    notifyListeners();
  }

  void onHideReadNotify(val){
    this.isHideReadNotify = val;
  }

  List<dynamic> getData(){
    List<dynamic> data = isPromote ? promotions:private;
    if(filter.isNotEmpty){
      data = data.where((i) => i['title'].toString().toLowerCase().contains(filter.toLowerCase())).toList();
    }
    if(isHideReadNotify){
      //todo add data filter here
    }
    return data;
  }
}