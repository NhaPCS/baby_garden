import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class RemindCalendarProvider extends ChangeNotifier {
  List<dynamic> remindList = List();

  void clearRemind() {
    remindList = null;
    notifyListeners();
  }

  Future<void> getListCalendar(
    BuildContext context,
  ) async {
    dynamic data = await service.getListRemindCalendar(context);
    if (data != null) {
      remindList = data;
      notifyListeners();
    }
  }

  void deleteCalendar(BuildContext context, String calendarId) async {
    await service.deleteRemindCalendar(context, calendarId: calendarId);
    getListCalendar(context);
  }
}
