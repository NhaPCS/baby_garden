import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class ServiceListProvider extends ChangeNotifier{
  List<dynamic> listService = List();

  Future<void> getServiceList(String userID, int type) async{
    listService.clear();
    listService = await service.listBookingService(userId: userID,type: type);
    notifyListeners();
  }
}