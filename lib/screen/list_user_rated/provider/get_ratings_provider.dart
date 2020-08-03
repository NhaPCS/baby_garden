import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/cupertino.dart';

class GetRatingsProvider extends ChangeNotifier {
  List<dynamic> ratings;
  List<dynamic> counts = List(8);

  Future<void> getData({String shopId, int type = 1}) async {
    dynamic data = await listRating(shopId: shopId, type: type);
    if (data != null) {
      ratings = data['list'];
      counts = data['count'];
      notifyListeners();
    }
  }
}
