import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/cupertino.dart';

class BookingRateTabBarProvider extends ChangeNotifier {
  bool isRated = false;
  List<dynamic> ratedData = List();
  List<dynamic> ratingData = List();

  Future<void> getBookingData(BuildContext context, {bool isService}) async {
    ratedData = await listBookingProduct(type: isService ? 4 : 9, isRate: "1");

    ratingData = await listBookingProduct(type: isService ? 4 : 9, isRate: "0");
    notifyListeners();
  }

  void onChange() {
    isRated = !isRated;
    notifyListeners();
  }
}
