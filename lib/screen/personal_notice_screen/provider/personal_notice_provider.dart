import 'package:baby_garden_flutter/data/service.dart';
import 'package:flutter/cupertino.dart';

class PersonalNoticeProvider extends ChangeNotifier{
  dynamic detail ;

  Future<void> getNotifyDetail({String notifyId}) async{
    detail = await notificationDetail(notifyID: notifyId);
    notifyListeners();
  }
}