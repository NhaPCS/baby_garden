import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class BookingDetailProvider extends ChangeNotifier {
  dynamic bookingDetialData;

  Future<void> getBookingDetail(var bookingId) async {
    bookingDetialData = await service.bookingDetail(bookingID: bookingId);
    notifyListeners();
  }
}