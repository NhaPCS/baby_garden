import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/cupertino.dart';

class GetListVoucherProvider extends ChangeNotifier {
  List<dynamic> vouchers;
  int totalElements = 0;

  Future<void> getListVoucher({int index = 0, String categoryID}) async {
    dynamic data =
        await service.listVoucher(index: index, categoryId: categoryID);
    if (data != null) {
      vouchers = data['list'];
      totalElements = data['total'];
      notifyListeners();
    }
  }
}
