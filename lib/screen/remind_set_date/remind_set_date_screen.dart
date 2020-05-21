import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:nested/nested.dart';
import 'package:table_calendar/table_calendar.dart';

class RemindSetDateScreen extends StatefulWidget {
  @override
  _RemindSetDateScreenState createState() => _RemindSetDateScreenState();
}

class _RemindSetDateScreenState extends BaseState<RemindSetDateScreen> {
  CalendarController _calenderController;
  final locale = 'vi';

  @override
  void initState() {
    super.initState();
    _calenderController = CalendarController();
  }

  @override
  Widget buildWidget(BuildContext context) {
    String buttonTitle = S.of(context).confirm;
    initializeDateFormatting('en', null);

    return Scaffold(
        appBar: getAppBar(title: S.of(context).selectRemindTime),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: SizeUtil.midSmallSpace),
                    width: double.infinity,
                    decoration: setBorder('top', Color(0xffE1D9D9), 1),
                    padding: const EdgeInsets.only(
                        left: SizeUtil.normalSpace,
                        top: SizeUtil.defaultSpace,
                        bottom: SizeUtil.defaultSpace),
                    child: Text(
                      S.of(context).selectRemindDate,
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                      decoration: setBorder('top', Color(0xffE4E4E4), 6),
                      padding: EdgeInsets.only(top: SizeUtil.defaultSpace),
                      child: TableCalendar(
                        locale: this.locale,
                        calendarController: _calenderController,
                        calendarStyle: CalendarStyle(
                          todayColor: Color.fromRGBO(255, 137, 24, 0.7),
                          selectedColor: ColorUtil.primaryColor,
                        ),
                        headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            centerHeaderTitle: true,
                            titleTextStyle:
                                TextStyle(fontSize: SizeUtil.textSizeBig),
                            titleTextBuilder: (date, locale) =>
                                '${S.of(context).month} ' +
                                DateFormat.M(locale).format(date)),
                      )),
                  WidgetUtil.getLine(color: Color(0xffE4E4E4), width: 6),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: SizeUtil.normalPadding,
                child: MyRaisedButton(
                    padding: SizeUtil.smallPadding,
                    text: buttonTitle,
                    textStyle: TextStyle(
                        fontSize: SizeUtil.textSizeBigger,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    color: ColorUtil.primaryColor,
                    borderRadius: SizeUtil.tinyRadius,
                    matchParent: true,
                    onPressed: () {
                      Navigator.of(context)
                          .pop(_calenderController.selectedDay);
                    }),
              ),
            )
          ],
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
