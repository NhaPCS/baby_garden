import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/provider/orders_provider.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingProductViewModel extends BaseViewModel {
  dynamic bookingData;
  int totalPoint = -1;

  Future<int> getPoint(shopId) async {
    if (totalPoint == -1) {
      List<dynamic> data = await service.getListPoint(context);
      if (data != null && data.length != 0) {
        for (int i = 0; i < data.length; i++) {
          if (data[i]["shop_id"] == shopId) {
            totalPoint = int.parse(data[i]["point"]);
            return int.parse(data[i]["point"]);
          }
        }
      }
    } else {
      return totalPoint;
    }
    return 0;
  }

  Future<bool> onBookingProduct(
    BuildContext context, {
    @required String timeId,
    @required String point,
    @required String shopID,
    @required String promoteCode,
    @required String isReceiveInShop,
    @required String paymentMethod,
    @required String note,
    @required String address,
    @required String userName,
    @required String userPhone,
    @required String userAddress,
    @required String cityID,
    @required String districtID,
    @required String wardId,
    @required String shipCode,
    @required String shipCoupon,
  }) async {
    var userID =
        Provider.of<UserProvider>(context, listen: false).userInfo['id'];
    var now = new DateTime.now();
    var dateFormat = new DateFormat('yyyy-MM-dd');
    var timeFormat = new DateFormat('Hms');
    var bookingDate = dateFormat.format(now),
        bookingTime = timeFormat.format(now);
    dynamic data = await service.bookingProduct(
        timeId: timeId,
        point: point,
        userID: userID,
        shopID: shopID,
        bookingDate: bookingDate,
        bookingTime: bookingTime,
        promoteCode: promoteCode,
        isReceiveInShop: isReceiveInShop,
        paymentMethod: paymentMethod,
        note: note,
        address: address,
        userName: userName,
        userPhone: userPhone,
        userAddress: userAddress,
        cityID: cityID,
        districtID: districtID,
        wardId: wardId,
        shipCode: shipCode,
        shipCoupon: shipCoupon);
    if (data != null) {
      bookingData = data;
      Provider.of<OrdersProvider>(context, listen: false).getOrdersCount();
      return true;
    }
    return false;
  }

  String getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  String getFinishedBookingCode() {
    if (bookingData != null &&
        bookingData.runtimeType != String &&
        bookingData['code'] != null) return bookingData['code'];
    return '';
  }

  @override
  BuildContext context;

  BookingProductViewModel(this.context);
}
