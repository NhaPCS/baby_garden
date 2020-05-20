import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ServiceDetailViewModel extends BaseViewModel {
  Future<void> onCancelBooking(BuildContext context, {String bookingId}) async {
    await cancelBooking(
      context,
      bookingId: bookingId,
    );
  }

  @override
  BuildContext context;

  ServiceDetailViewModel(this.context);
}
