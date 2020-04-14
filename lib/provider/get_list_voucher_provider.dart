import 'package:flutter/cupertino.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class GetListVoucherProvider extends ChangeNotifier{
  List<dynamic> vouchers;
  int total = 0;
  Future<void> getListVoucher(int index, int numberPost, String categoryID)async{
    dynamic data = await service.listVoucher(index: index.toString(),numberPost: numberPost.toString(),category: categoryID);
    if(data != null) {
      vouchers = data['list'];
      total = data['total'];
      notifyListeners();
    }
  }
}