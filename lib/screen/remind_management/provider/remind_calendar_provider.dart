import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class RemindCalendarProvider extends ChangeNotifier {
  List<dynamic> remindList = List();
  RemindCalendar newRemindCalendar = RemindCalendar();
  int selectedRadio = 1;

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
      remindList = data;
      notifyListeners();
    }
  }

  RemindCalendar getRemind(int index) {
    final calendar = remindList[index];
    final remind = RemindCalendar().fromJson(calendar);

    return remind;
  }

  Future<bool> addNewCalendar(BuildContext context,
      {bool isEdit = false, RemindCalendar calendar}) async {
    final _calendar = isEdit ? calendar : newRemindCalendar;
    final addSuccess =
        await service.addRemindCalendar(context, calendar: _calendar);

    notifyListeners();
    return addSuccess != null;
  }

  Future<bool> deleteCalendar(BuildContext context, String calendarId) async {
    final deleteSuccess =
        await service.deleteRemindCalendar(context, calendarId: calendarId);

    notifyListeners();
    return deleteSuccess != null;
  }

  void setSelectedRadio(int val, {bool selectRemind}) {
    print(val);
    this.selectedRadio = val;
    notifyListeners();
  }

  void setNewRemindCalendar({
    String productId,
    String dateStart,
    String timeStart,
    String dateEnd,
    String timeEnd,
    RemindType type,
    String period,
    String time1,
    String time2,
    String time3,
    String time4,
    String image,
    String productName,
    String price,
    String datetime,
  }) {
    if (productId != null) this.newRemindCalendar.productId = productId;
    if (image != null) this.newRemindCalendar.image = image;
    if (price != null) this.newRemindCalendar.price = price;
    if (datetime != null) this.newRemindCalendar.datetime = datetime;
    if (period != null) this.newRemindCalendar.period = period;
    notifyListeners();

    print('update productId  $productId');
  }
}
