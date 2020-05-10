import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class TransferMethodProvider extends ChangeNotifier{
  int transferMethod =0;
  int price = 0;
  List<dynamic> ships = List();

  Future<void> getShips() async{
    ships = await service.listShiper();
    try {
      final method = ships[transferMethod];
      price = int.parse(method['price']) - int.parse(method['price_discount']);
    } catch (e) {
      print(e);
      price = 0;
    }
    notifyListeners();
  }
  void onChange(val){
    transferMethod = val;
    final method = ships[val];
    try {
      price = int.parse(method['price']) - int.parse(method['price_discount']);
    } catch (e) {
      print(e);
      price = 0;
    }
    notifyListeners();
  }
}