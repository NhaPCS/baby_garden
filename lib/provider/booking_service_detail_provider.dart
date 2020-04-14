import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/cupertino.dart';

class BookingServiceDetailProvider extends ChangeNotifier {
  dynamic data;
  List<dynamic> products = List();
  Future<dynamic> getdata(String userID, String shopID) async {
    data = await shopDetail(userID:userID, shopID: "1");
    products = await listProductShop(userID:userID, shopID: shopID);
    if (data != null) {
      print("BookingServiceDetailProvider $data");
    }
    notifyListeners();
  }

}