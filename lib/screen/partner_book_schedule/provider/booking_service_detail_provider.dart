import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:flutter/cupertino.dart';

class BookingServiceDetailProvider extends ChangeNotifier {
  dynamic data;
  List<dynamic> products = List();
  Future<dynamic> getdata( String shopID) async {
    String userID = await ShareValueProvider.shareValueProvider.getUserId();
    data = await shopDetail(userID:"1", shopID: "1");
    products = await listProductShop(userID:userID, shopID: shopID);
    if (data != null) {
      print("BookingServiceDetailProvider $data");
    }
    notifyListeners();
  }

}