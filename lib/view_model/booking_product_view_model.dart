import 'package:baby_garden_flutter/data/service.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BookingProductViewModel extends BaseViewModel{


  Future<void> onBookingProduct(String shopID, String promoteCode, String isReceiveInShop,
      String paymentMethod, String note, String shipID, String address, String shipCode,String userName,
      String userPhone,String userAddress,String cityID,String districtID)
  async {
    var userID = Provider.of<UserProvider>(context,listen: false).userInfo['id'];
    var bookingDate,bookingTime;
    dynamic data = await bookingProduct(userID: userID, shopID: shopID, bookingDate: bookingDate!=null?bookingDate:"12:01:20", bookingTime:bookingTime!=null?bookingTime:"12:12:12",
        promoteCode: promoteCode, isReceiveInShop:isReceiveInShop, paymentMethod:paymentMethod, note:note, shipID:shipID,
        address:address, shipCode:shipCode, userName:userName, userPhone:userPhone, userAddress:userAddress, cityID:cityID,
        districtID:districtID);
    if (data!=null){

    }
  }
  @override
  BuildContext context;

  BookingProductViewModel(this.context);
}