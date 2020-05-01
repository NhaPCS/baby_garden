import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class RemindCalendarProvider extends ChangeNotifier {
  List<dynamic> remindList = List();
  RemindCalendar newRemindCalendar = RemindCalendar();

  int total;
  int totalPage;

  void clearRemind() {
    remindList = null;
    notifyListeners();
  }

  Future<void> getListCalendar(BuildContext context,
      {String categoryId,
      int index = 1,
      int numberPosts = service.PAGE_SIZE}) async {
    dynamic data = await service.getListRemindCalendar(context);

    if (data != null && data.length != 0) {
      remindList = data['list'];
      total = data['total'];
      totalPage = (data['total'] / numberPosts).toInt() + 1;
      notifyListeners();
    }
  }

  RemindCalendar getRemind(int index) {
    final calendar = remindList[index]['calendar'];
    final product = remindList[index]['product'];

    final remind = RemindCalendar(
        calendarId: calendar['calendar_id'],
        dateStart: calendar['date_start'],
        timeStart: calendar['time_start'],
        dateEnd: calendar['date_end'],
        timeEnd: calendar['time_end'],
        type:
            calendar['type'] == 1 ? RemindType.remindBuy : RemindType.remindUse,
        period: calendar['period'] == 1
            ? RemindPeriod.everyday
            : RemindPeriod.twiceDay,
        time1: calendar['time_1'],
        time2: calendar['time_2'],
        time3: calendar['time_3'],
        time4: calendar['time_4'],
        // datetime: calendar['date_time']

        productId: product['product_id'],
        description: product['name'],
        price: product['price']);

    return remind;
  }

  Future<bool> addNewCalendar(BuildContext context,
      {bool isEdit = false, RemindCalendar calendar}) async {
    final _calendar = isEdit ? calendar : newRemindCalendar;
    final addSuccess =
        await service.addRemindCalendar(context, calendar: _calendar);

    return addSuccess != null;
  }

  Future<bool> deleteCalendar(BuildContext context, String calendarId) async {
    final deleteSuccess =
        await service.deleteRemindCalendar(context, calendarId: calendarId);

    return deleteSuccess != null;
  }
}
