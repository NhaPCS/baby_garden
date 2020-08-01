import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/cupertino.dart';

class GetRatingsProvider extends ChangeNotifier{
  List<dynamic> ratings;

  Future<void> getData({String shopId, int type = 1}) async {
    ratings = await listRating(shopId: shopId, type: type);
    notifyListeners();
  }
}