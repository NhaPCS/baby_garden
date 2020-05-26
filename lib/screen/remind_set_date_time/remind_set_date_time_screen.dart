import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:nested/nested.dart';
import 'package:table_calendar/table_calendar.dart';

class RemindSetDateTimeScreen extends StatefulWidget {
  @override
  _RemindSetDateTimeScreenState createState() =>
      _RemindSetDateTimeScreenState();
}

class _RemindSetDateTimeScreenState extends BaseState<RemindSetDateTimeScreen> {
  final locale = 'vi';
  ValueNotifier<DateTime> _selectedDateTime = ValueNotifier(DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    initializeDateFormatting('vi', null);

    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).selectRemindBuyTime,
      ),
      body: ListView(children: <Widget>[
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
            ValueListenableBuilder<DateTime>(
              valueListenable: _selectedDateTime,
              builder: (BuildContext context, DateTime value, Widget child) {
                return Text(
                  DateUtil.formatNormalDateTime(value),
                  style: TextStyle(
                      color: ColorUtil.darkGray,
                      fontSize: SizeUtil.textSizeBigger),
                );
              },
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
                        right: SizeUtil.smallSpace, left: SizeUtil.smallSpace),
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
                              pickerTextStyle:
                                  TextStyle(color: Colors.orange, fontSize: 20),
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
                        _selectedDateTime.value = new DateTime(
                            _selectedDateTime.value.year,
                            _selectedDateTime.value.month,
                            _selectedDateTime.value.day,
                            chosenTime.hour,
                            chosenTime.minute);
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
                Navigator.of(context).pop(_selectedDateTime.value);
              },
              child: Text(
                S.of(context).done,
                style: TextStyle(fontSize: SizeUtil.textSizeBigger),
              ),
              textColor: Colors.white,
            ),
          ),
        )
      ]),
    );
  }

  Future<void> selectDate() async {
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    _selectedDateTime.value = selectedDate;
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
