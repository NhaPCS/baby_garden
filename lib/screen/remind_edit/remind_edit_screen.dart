import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/remind_management/item/remind_card_item.dart';
import 'package:baby_garden_flutter/screen/remind_management/provider/remind_calendar_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../base_state.dart';

class RemindEditScreen extends StatefulWidget {
  final RemindCalendar calendar;

  const RemindEditScreen({Key key, this.calendar}) : super(key: key);
  @override
  _RemindEditScreen createState() => _RemindEditScreen();
}

class _RemindEditScreen extends BaseState<RemindEditScreen> {
  var chosenDate = DateTime.now();
  var chosenTime;

  final RemindCalendarProvider _remindCalendarProvider =
      RemindCalendarProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          title: S.of(context).editReminder,
        ),
        body: Column(children: <Widget>[
          Container(child: RemindCardItem(calendar: widget.calendar)),
          Container(
            padding: EdgeInsets.only(left: SizeUtil.smallSpace, top: 13.5),
            width: double.infinity,
            height: SizeUtil.hugSpace,
            child: Text(
              S.of(context).selectRemindBuyTime,
              style: TextStyle(
                  color: ColorUtil.darkGray, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: SizeUtil.smallSpace),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: SizeUtil.lineHeight,
                        style: BorderStyle.solid,
                        color: Color(0xffE4E4E4)),
                    bottom: BorderSide(
                        width: SizeUtil.lineHeight,
                        style: BorderStyle.solid,
                        color: Color(0xffE4E4E4)))),
            height: SizeUtil.hugSpace,
            child: Row(children: <Widget>[
              Text(
                this.chosenDate.toString(),
                style: TextStyle(
                    color: ColorUtil.darkGray,
                    fontSize: SizeUtil.textSizeBigger),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // display table choose date
                  this.selectDate();
                },
                child: Row(
                  children: <Widget>[
                    SvgIcon(
                      'timetable.svg',
                      color: Color.fromRGBO(255, 153, 0, 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: SizeUtil.smallSpace,
                          left: SizeUtil.smallSpace),
                      child: Text(
                        S.of(context).date,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 153, 0, 1),
                            fontSize: SizeUtil.textSizeBigger),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
          Container(
            // time picker
            child: Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                          cupertinoOverrideTheme: CupertinoThemeData(
                              barBackgroundColor: Colors.green,
                              scaffoldBackgroundColor: Colors.grey,
                              textTheme: CupertinoTextThemeData(
                                pickerTextStyle: TextStyle(
                                    color: Colors.orange, fontSize: 20),
                                tabLabelTextStyle: TextStyle(fontSize: 80),
                                navLargeTitleTextStyle: TextStyle(fontSize: 50),
                                navActionTextStyle:
                                    TextStyle(color: Colors.orange),
                                navTitleTextStyle: TextStyle(fontSize: 40),
                                dateTimePickerTextStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.orange,
                                ),
                              ))
                          // textSelectionColor: Colors.orange
                          ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: true,
                        // backgroundColor: Colors.orange,
                        onDateTimeChanged: (chosenTime) {
                          print(chosenTime);
                          this.chosenTime = chosenTime;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            height: 250,
            decoration:
                setBorder('bottom', Color(0xffE4E4E4), SizeUtil.lineHeight),
          ),
          Spacer(),
          Container(
            padding: SizeUtil.normalPadding,
            child: ButtonTheme(
              buttonColor: ColorUtil.primaryColor,
              padding: SizeUtil.normalPadding,
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  // edit remind calendar
                  if (!validateInput()) return;

                  _remindCalendarProvider.addNewCalendar(context,
                      calendar: widget.calendar);
                  // RouteUtil.push(context, RemindManagementScreen());
                  //                  showTimePicker(context: context, initialTime: TimeOfDay.now());
                  Navigator.of(context).pop();
                },
                child: Text(
                  S.of(context).saveChange,
                  style: TextStyle(fontSize: SizeUtil.textSizeBigger),
                ),
                textColor: Colors.white,
              ),
            ),
          )
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _remindCalendarProvider)];
  }

  void selectDate() {
    Future<DateTime> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    setState(() {
      selectedDate.then((value) => this.chosenDate = value);
    });
  }

  bool validateInput() {
    // add check validate input after
    return false;
  }
}
