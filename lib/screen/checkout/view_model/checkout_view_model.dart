import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class CheckoutViewModel extends BaseViewModel{

  Future<void> onCheckout({String userID,String bookingId,double money, String content, String note}) async {
    dynamic data = await payment(userID: userID,bookingId: bookingId,money: money,content: content,note: note);
    if (data != null) {
    }
  }

  @override
  BuildContext context;

  CheckoutViewModel(this.context);

}