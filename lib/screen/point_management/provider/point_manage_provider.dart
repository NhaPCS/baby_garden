import 'package:baby_garden_flutter/data/model/PointDetail.dart';
import 'package:baby_garden_flutter/data/model/point.dart';
import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class PointManageProvider extends ChangeNotifier {
  List<dynamic> pointList = List();
  List<dynamic> pointDetailList = List();
  RemindCalendar newRemindCalendar = RemindCalendar();

  int total;
  int totalPage;

  void clearPoint() {
    pointList = null;
    notifyListeners();
  }

  Future<void> getPointList(BuildContext context,
      {int index = 1, int numberPosts = service.PAGE_SIZE}) async {
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

  Future<void> getPointDetailList(BuildContext context, int shopId,
      {int index = 1, int numberPosts = service.PAGE_SIZE}) async {
    dynamic data = await service.getPointDetail(context, shopId.toString());

    if (data != null && data.length != 0) {
      pointDetailList = data['list'];
      total = data['total'];
      totalPage = (data['total'] / numberPosts).toInt() + 1;
      notifyListeners();
    }
  }

  PointDetail getPointDetail(int index) {
    final detail = pointDetailList[index];
    final pointDetail = PointDetail(
        shopImage: detail['shop_image'],
        history: detail['detail'],
        dateTime: detail['dateTime'],
        changePoint: detail['change_point'],
        currentPoint: detail['current_point']);

    return pointDetail;
  }
}
