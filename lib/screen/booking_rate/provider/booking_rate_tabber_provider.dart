import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/cupertino.dart';

class BookingRateTabBarProvider extends ChangeNotifier {
  bool isRated = false;
  List<dynamic> ratedData = List();
  List<dynamic> ratingData = List();

  Future<void> getBookingData(BuildContext context, {bool isService}) async {
    var data = isService
        ? await listBookingService(
            type: 4,
          )
        : await listBookingProduct(
            type: 9,
          );
    ratedData = data
        .where((i) => i['is_rate'].toString().toLowerCase().contains("1"))
        .toList();
    ratingData = data
        .where((i) => i['is_rate'].toString().toLowerCase().contains("0"))
        .toList();
    notifyListeners();
  }

  void onChange() {
    isRated = !isRated;
    notifyListeners();
  }
}
