import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class OrderListProvider extends ChangeNotifier{
  List<dynamic> orderList = List();

  Future<void> getListData(int type) async{
    orderList.clear();
    orderList = await service.listBookingProduct( type: type);
    notifyListeners();
  }
}