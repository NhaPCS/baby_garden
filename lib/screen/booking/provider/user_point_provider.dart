import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class UserPointProvider extends ChangeNotifier {
  int totalPoint = -1;

  Future<void> getPoint(BuildContext context, {shopId = "0"}) async {
    List<dynamic> data = await service.getListPoint(context);
    if (data != null && data.length != 0) {
      print(data[0]["point"]);
      for (int i = 0; i < data.length; i++) {
        if (data[i]["shop_id"] == shopId) {
          totalPoint = int.parse(data[i]["point"]);
          print("total point $totalPoint");
          notifyListeners();
          return;
        }
      }
    }
  }
}
