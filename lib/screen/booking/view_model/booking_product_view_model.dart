import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingProductViewModel extends BaseViewModel {
  dynamic bookingData="";
  int totalPoint = -1;

  Future<int> getPoint(shopId) async {
    if(totalPoint==-1){
      List<dynamic> data = await service.getListPoint(context);
      if (data != null && data.length != 0) {
        for(int i=0;i< data.length;i++ ){
          if(data[i]["shop_id"] == shopId){
            totalPoint = int.parse(data[i]["point"]);
            return int.parse(data[i]["point"]);
          }
        }
      }
    }else{
      return totalPoint;
    }
    return 0;
  }

  Future<void> onBookingProduct(
      String inShopReceiveTime,
      String point,
      String shopID,
      String promoteCode,
      String isReceiveInShop,
      String receiveTime,
      String paymentMethod,
      String note,
      String shipID,
      String address,
      String shipCode,
      String userName,
      String userPhone,
      String userAddress,
      String cityID,
      String districtID,
      String ward_id
      ) async {
    var userID =
        Provider.of<UserProvider>(context, listen: false).userInfo['id'];
    var now = new DateTime.now();
    var dateFormat = new DateFormat('yyyy-MM-dd');
    var timeFormat = new DateFormat('Hms');
    var bookingDate = dateFormat.format(now),
        bookingTime = timeFormat.format(now);
    dynamic data = await service.bookingProduct(
      inShopReceiveTimeId: inShopReceiveTime,
      point: point,
        userID: userID,
        shopID: shopID,
        bookingDate:  bookingDate,
        bookingTime: bookingTime,
        promoteCode: promoteCode,
        isReceiveInShop: isReceiveInShop,
        timeReceive: receiveTime,
        paymentMethod: paymentMethod,
        note: note,
        shipID: shipID,
        address: address,
        shipCode: shipCode,
        userName: userName,
        userPhone: userPhone,
        userAddress: userAddress,
        cityID: cityID,
        districtID: districtID,
      ward_id: ward_id
    );
    if (data != null) {
      bookingData = data;
    }
  }



  String getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  @override
  BuildContext context;

  BookingProductViewModel(this.context);
}
