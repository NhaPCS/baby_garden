import 'package:flutter/cupertino.dart';

import 'package:baby_garden_flutter/data/service.dart' as service;

class OrderListProvider extends ChangeNotifier{
  List<dynamic> orderList = List();

  Future<void> getListData(int userId, int type) async{
    orderList.clear();
    orderList = await service.listBookingProduct(userId: userId, type: type);
    notifyListeners();
  }
}