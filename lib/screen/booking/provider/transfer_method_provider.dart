import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class TransferMethodProvider extends ChangeNotifier{
  int transferMethod =0;
  int price = 0;
  String promoteCode="";
  bool isActiveCode = false;
  List<dynamic> ships = List();

  Future<void> getShips() async{
    ships = await service.listShiper();
    try {
      final method = ships[transferMethod];
      price = int.parse(method['price']);
      promoteCode = method['promotion_code'];
      isActiveCode = false;
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
      price = int.parse(method['price']);
      promoteCode = method['promotion_code'];
      isActiveCode = false;
    } catch (e) {
      print(e);
      price = 0;
    }
    notifyListeners();
  }

  bool checkPromoteCode(code){
    return code == promoteCode;
  }

  void setIsActive(){
    isActiveCode = true;
    price = int.parse(ships[transferMethod]['price'])- int.parse(ships[transferMethod]['price_discount']);
    notifyListeners();
  }

  void removePromote(){
    price = int.parse(ships[transferMethod]['price']);
    isActiveCode = false;
    notifyListeners();
  }

}