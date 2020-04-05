import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class BookingDetailProvider extends ChangeNotifier {
  dynamic bookingDetialData;

  Future<void> getBookingDetail(String userId, var bookingId) async {
    bookingDetialData = await service.bookingDetail(userId: userId, bookingID: bookingId);
    notifyListeners();
  }
}