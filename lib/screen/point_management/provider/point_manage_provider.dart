import 'package:baby_garden_flutter/data/model/point.dart';
import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class PointManageProvider extends ChangeNotifier {
  List<dynamic> pointList = List();
  RemindCalendar newRemindCalendar = RemindCalendar();

  int total;
  int totalPage;

  void clearPoint() {
    pointList = null;
    notifyListeners();
  }

  Future<void> getPointList(BuildContext context,
      {String categoryId,
      int index = 1,
      int numberPosts = service.PAGE_SIZE}) async {
    dynamic data = await service.getListPoint(context);

    if (data != null && data.length != 0) {
      pointList = data['list'];
      total = data['total'];
      totalPage = (data['total'] / numberPosts).toInt() + 1;
      notifyListeners();
    }
  }

  Point getPoint(int index) {
    final point = Point(
      shopId: pointList[index]['shop_id'],
      shopName: pointList[index]['shop'],
      shopImage: pointList[index]['shop_image'],
      point: pointList[index]['point'],
    );

    return point;
  }

  Future<bool> getPointDetail(BuildContext context, String shopId) async {
    final addSuccess = await service.getPointDetail(context, shopId);

    return addSuccess != null;
  }
}
