import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/remind_add/view_model/reminder_add_view_model.dart';
import 'package:baby_garden_flutter/screen/remind_management/widget/reminder_layout.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class SetScheduleForProductDialog extends StatefulWidget {
  final dynamic product;

  SetScheduleForProductDialog({Key key, this.product}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State
    extends BaseStateModel<SetScheduleForProductDialog, ReminderAddViewModel> {
  RemindCalendar _remindCalendar = RemindCalendar();

  @override
  Widget buildWidget(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      contentPadding: EdgeInsets.all(0),
      titlePadding: EdgeInsets.all(0),
      title: Container(
        decoration: BoxDecoration(
            color: ColorUtil.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        padding: SizeUtil.smallPadding,
        child: Text(
          S.of(context).set_schedule_alarm_product,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: SizeUtil.textSizeDefault),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: SizeUtil.smallPadding,
            child: MyText(
              widget.product['product_name'],
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: ColorUtil.blue, fontSize: SizeUtil.textSizeDefault),
            ),
          ),
          ReminderLayout(
            showDesc: false,
            hasDivider: true,
            reminderSelectCallBack:
                (type, buyDate, endDate, period, time1, time2, time3, time4) {
              _remindCalendar.type =
                  type == 1 ? RemindType.remindBuy : RemindType.remindUse;
              _remindCalendar.dateStart =
                  DateUtil.formatNormalDateTime(buyDate);
              _remindCalendar.timeStart = DateUtil.formatTime(buyDate);
              _remindCalendar.dateEnd = DateUtil.formatNormalDateTime(endDate);
              _remindCalendar.timeEnd = DateUtil.formatTime(endDate);
              _remindCalendar.period = period.toString();
              _remindCalendar.time1 = DateUtil.formatTime(time1);
              _remindCalendar.time2 = DateUtil.formatTime(time2);
              _remindCalendar.time3 = DateUtil.formatTime(time3);
              _remindCalendar.time4 = DateUtil.formatTime(time4);
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyRaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).enter_again,
                borderRadius: 30,
                color: ColorUtil.primaryColor,
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: SizeUtil.defaultSpace,
              ),
              MyRaisedButton(
                onPressed: () {
                  getViewModel()
                      .addNewCalendar(context, calendar: _remindCalendar);
                },
                text: S.of(context).agree,
                color: ColorUtil.primaryColor,
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                borderRadius: 30,
              )
            ],
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          )
        ],
      ),
    );
  }

  @override
  ReminderAddViewModel initViewModel() {
    return new ReminderAddViewModel(context);
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
