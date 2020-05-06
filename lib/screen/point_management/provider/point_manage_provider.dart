import 'package:baby_garden_flutter/data/model/PointDetail.dart';
import 'package:baby_garden_flutter/data/model/point.dart';
import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class PointManageProvider extends ChangeNotifier {
  List<dynamic> pointList = List();
  List<dynamic> pointDetailList = List();
  RemindCalendar newRemindCalendar = RemindCalendar();

  void clearPoint() {
    pointList = null;
    notifyListeners();
  }

  Future<void> getPointList(
    BuildContext context,
  ) async {
    dynamic data = await service.getListPoint(context);

    if (data != null && data.length != 0) {
      print(data);
      pointList = data;
      notifyListeners();
    }
  }

  Point getPoint(int index) {
    final point = Point(
      shopId: pointList[index]['shop_id'],
      shopName: pointList[index]['shop_name'],
      shopImage: pointList[index]['img'],
      point: pointList[index]['point'],
    );

    return point;
  }

  Future<void> getPointDetailList(BuildContext context, String shopId) async {
    dynamic data = await service.getPointDetail(context, shopId.toString());

    if (data != null && data.length != 0) {
      pointDetailList = data;
      notifyListeners();
    }
  }

  PointDetail getPointDetail(int index) {
    final detail = pointDetailList[index];
    final pointDetail = PointDetail(
        shopImage: detail['shop_image'],
        history: detail['content'],
        dateTime: detail['date'],
        changePoint: detail['point'],
        type: detail['type'],
        currentPoint:
            detail['current_point'] != null ? detail['current_point'] : '0');

    return pointDetail;
  }
}
