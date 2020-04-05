import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class TransferMethodProvider extends ChangeNotifier{
  int transferMenthod =0;
  List<dynamic> ships = List();

  Future<void> getShips() async{
    ships = await service.listShiper(userId: 1);
    notifyListeners();
  }
  void onChange(val){
    transferMenthod = val;
    notifyListeners();
  }
}