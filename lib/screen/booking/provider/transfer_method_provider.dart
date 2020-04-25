import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class TransferMethodProvider extends ChangeNotifier{
  int transferMenthod =0;
  int price = 0;
  List<dynamic> ships = List();

  Future<void> getShips() async{
    ships = await service.listShiper();
    try {
      final menthod = ships[transferMenthod];
      price = int.parse(menthod['price']) - int.parse(menthod['price_discount']);
    } catch (e) {
      print(e);
      price = 0;
    }
    notifyListeners();
  }
  void onChange(val){
    transferMenthod = val;
    final menthod = ships[val];
    try {
      price = int.parse(menthod['price']) - int.parse(menthod['price_discount']);
    } catch (e) {
      print(e);
      price = 0;
    }
    notifyListeners();
  }
}