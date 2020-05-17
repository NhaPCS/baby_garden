import 'dart:io';

import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CheckoutViewModel extends BaseViewModel {
  Future<void> onCheckout(
      {String userID,
      String bookingId,
      double money,
      String content,
      String note,
      File file}) async {
    await payment(context,
        userID: userID,
        bookingId: bookingId,
        money: money,
        content: content,
        note: note,
        img: file);
    Provider.of<CartProvider>(context,listen: false).getMyCart();
  }

  @override
  BuildContext context;

  CheckoutViewModel(this.context);
}
