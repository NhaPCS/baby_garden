import 'package:baby_garden_flutter/generated/intl/messages_all.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

// TODO-QAnh:screen đặt ở folder riêng, khong de chung trong 1 folder
class SetDateScreen extends StatefulWidget {
  @override
  _SetDateScreenState createState() => _SetDateScreenState();
}

class _SetDateScreenState extends BaseState<SetDateScreen> {
  final GetListProvider _getListProvider = GetListProvider();
  CalendarController _calenderController;

  // TODO-QAnh: k dung bo di
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
        body: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 8),
                width: double.infinity,
                decoration: setBorder('top', Color(0xffE1D9D9), 1),
                // TODO-QAnh: trong container co padding roi, khong can Padding nay nua
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
                  child: Text(
                    S.of(context).selectRemindDate,
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )),
            Container(
                decoration: setBorder('top', Color(0xffE4E4E4), 6),
                padding: EdgeInsets.only(top: 20),
                // TODO-QAnh: Column chỉ có 1 widget? bỏ Column đi
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // calender table
                  children: <Widget>[
                    // TODO-QAnh: xem lai cai Calender nay đang bị thiếu pixel
                    TableCalendar(
                      locale: this.locale,
                      calendarController: _calenderController,
                      calendarStyle: CalendarStyle(
                        todayColor: Color.fromRGBO(255, 137, 24, 0.7),
                        selectedColor: ColorUtil.primaryColor,
                      ),
                      headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          centerHeaderTitle: true,
                          titleTextStyle: TextStyle(fontSize: 23),
                          titleTextBuilder: (date, locale) =>
                              '${S.of(context).month} ' +
                              DateFormat.M(locale).format(date)),
                    )
                  ],
                )),
            Expanded(
                child: Container(
              decoration: setBorder('top', Color(0xffE4E4E4), 6),
            )),
            // TODO-QAnh: button dung MyRaisedButton
            GestureDetector(
              child: Container(
                margin: SizeUtil.normalPadding,
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: ColorUtil.primaryColor,
                    borderRadius: BorderRadius.circular(SizeUtil.tinyRadius)),
                child: Center(
                  child: Text(
                    buttonTitle,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeBigger,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
