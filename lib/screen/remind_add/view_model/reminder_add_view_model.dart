import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class ReminderAddViewModel extends BaseViewModel {
  @override
  BuildContext context;

  ReminderAddViewModel(this.context);

  Future<void> addNewCalendar(BuildContext context, {RemindCalendar calendar}) async {
    if (calendar.productId == null) {
      print("product id null");
      return;
    }

    dynamic data = await service.addRemindCalendar(context, calendar: calendar);

    if (data != null) {
      Navigator.of(context).pop(true);
    }
  }
}
