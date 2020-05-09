import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class BookingDetailProvider extends ChangeNotifier {
  dynamic bookingDetailData;

  Future<void> getBookingDetail(var bookingId) async {
    bookingDetailData = await service.bookingDetail(bookingID: bookingId);
    notifyListeners();
  }
}