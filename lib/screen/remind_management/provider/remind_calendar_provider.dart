import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class RemindCalendarProvider extends ChangeNotifier {
  List<dynamic> remindList = List();
  RemindCalendar newRemindCalendar = RemindCalendar();

  void clearRemind() {
    remindList = null;
    notifyListeners();
  }

  Future<void> getListCalendar(
    BuildContext context,
  ) async {
    dynamic data = await service.getListRemindCalendar(context);

    if (data != null && data.length != 0) {
      remindList = data;
      notifyListeners();
    }
  }

  Future<bool> addNewCalendar(BuildContext context,
      {bool isEdit = false, RemindCalendar calendar}) async {
    final _calendar = isEdit ? calendar : newRemindCalendar;
    final addSuccess =
        await service.addRemindCalendar(context, calendar: _calendar);

    notifyListeners();
    return addSuccess != null;
  }

  void deleteCalendar(BuildContext context, String calendarId) async {
    await service.deleteRemindCalendar(context, calendarId: calendarId);
    getListCalendar(context);
  }

}
