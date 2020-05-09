import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:flutter/cupertino.dart';

class BookingServiceDetailProvider extends ChangeNotifier {
  dynamic data;
  List<dynamic> products = List();
  Future<dynamic> getdata(BuildContext context, String shopID) async {
    String userID = await ShareValueProvider.shareValueProvider.getUserId();
    data = await shopDetail(context: context, shopID: shopID);
    products = await listProductShop( shopID: shopID);
    if (data != null) {
      print("BookingServiceDetailProvider $data");
    }
    notifyListeners();
  }

}