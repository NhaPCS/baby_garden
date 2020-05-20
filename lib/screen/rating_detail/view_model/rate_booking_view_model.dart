import 'dart:io';

import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class RateBookingViewModel extends BaseViewModel{
  int rateProductCount = 0;
  int rateProductNumber = 0;
  void setRateProductNumber(val){
    this.rateProductNumber = val;
  }

  Future<void> onRateBooking({String bookingId,String star , String content ,File img}) async {
    dynamic data = await rateBooking(context,bookingID: bookingId,star: star,content: content,img: img);
    if (data != null) {
    }
    Navigator.of(context).pop();
  }

  Future<void> onRateProduct({String productId,String bookingId,String star , String content ,File img}) async {
    dynamic data = await rateProduct(context,productId: productId,bookingID: bookingId,star: star,content: content,img: img);
    if(rateProductCount+1 == rateProductNumber){
      Navigator.of(context).pop();
    }else{
      print("count $rateProductCount $rateProductNumber");
      rateProductCount ++;
    }
    if (data != null) {
    }
  }

  @override
  BuildContext context;

  RateBookingViewModel(this.context);
}