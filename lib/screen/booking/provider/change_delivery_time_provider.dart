import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/cupertino.dart';

class ChangeDeliveryTimeProvider extends ChangeNotifier {
  int receiveTime = 0;
  int receiveDate = 0;
  List<dynamic> schedules = List();

  Future<void> getInShopReceiveTime(BuildContext context, String shopId) async {
    schedules = await shopReceiveTime(context: context, shopID: shopId);
    notifyListeners();
  }

  List<dynamic> getDateSchedule() {
    return schedules
        .where((i) => i['number'].toString().toLowerCase().contains(receiveDate.toString().toLowerCase()))//condition
        .toList();
  }

  onChangeTime(val) {
    receiveTime = val;
    notifyListeners();
  }

  onChangeDate(val) {
    receiveDate = val;
    notifyListeners();
  }
}
