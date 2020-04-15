import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class OrderListProvider extends ChangeNotifier{
  List<dynamic> orderList = List();

  Future<void> getListData(String userId, int type) async{
    orderList.clear();
    orderList = await service.listBookingProduct(userId: userId, type: type);
    notifyListeners();
  }
}