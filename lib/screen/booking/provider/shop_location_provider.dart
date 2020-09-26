import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/cupertino.dart';

class ShopLocationProvider extends ChangeNotifier{
  int shopLocation;
  List<dynamic> locations = List();

  void onChange(val){
    shopLocation = val;
    notifyListeners();
  }

  Future<dynamic> getShopId( String shopID) async {
    dynamic data = await shopDetail( shopID: shopID);
    locations = data['place'];
//    print(locations);
    notifyListeners();
  }
}

