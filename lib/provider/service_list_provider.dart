import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class ServiceListProvider extends ChangeNotifier{
  List<dynamic> listService = List();

  Future<void> getServiceList(int userID, int type) async{
    listService.clear();
    listService = await service.listBookingService(userId: userID,type: type);
    notifyListeners();
  }
}