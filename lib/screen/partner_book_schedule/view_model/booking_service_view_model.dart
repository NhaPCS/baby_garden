import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BookingServiceViewModel extends BaseViewModel {
  String userID;

  Future<void> onSendBookingService(String shopID, String serviceID,
      String address, String dateBooking, String timeBooking) async {
    if (userID==null)
      userID = await ShareValueProvider.shareValueProvider.getUserId();
    dynamic data = await bookingService(
        userID: userID,
        shopID: shopID,
        dateBooking: timeBooking,
        timeBooking: timeBooking,
        serviceID: serviceID,
        address: address);
    if (data != null) {}
  }


  @override
  BuildContext context;

  BookingServiceViewModel(this.context);
}
