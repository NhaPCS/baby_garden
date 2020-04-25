import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class RateBookingViewModel extends BaseViewModel{

  Future<void> onRateBooking({int bookingId,double star , String content }) async {
    dynamic data = await rateBooking(bookingID: bookingId,star: star,content: content);
    if (data != null) {
    }
  }

  @override
  BuildContext context;

  RateBookingViewModel(this.context);
}