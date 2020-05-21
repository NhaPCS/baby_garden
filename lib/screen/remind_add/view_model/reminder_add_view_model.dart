import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/data/service.dart' as service;

class ReminderAddViewModel extends BaseViewModel {
  @override
  BuildContext context;

  ReminderAddViewModel(this.context);

  void addNewCalendar(BuildContext context, {RemindCalendar calendar}) async {
    dynamic data = await service.addRemindCalendar(context, calendar: calendar);
    if (data != null) {
      Navigator.of(context).pop();
    }
  }
}
