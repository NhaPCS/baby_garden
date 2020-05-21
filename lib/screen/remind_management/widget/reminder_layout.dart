import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/remind_add/provider/remind_add_provider.dart';
import 'package:baby_garden_flutter/screen/remind_cycle/remind_cycle_screen.dart';
import 'package:baby_garden_flutter/screen/remind_management/provider/remind_calendar_provider.dart';
import 'package:baby_garden_flutter/screen/remind_set_date/remind_set_date_screen.dart';
import 'package:baby_garden_flutter/screen/remind_set_time/remind_set_time_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/line/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ReminderLayout extends StatefulWidget {
  final bool showDesc;
  final bool hasDivider;

  const ReminderLayout({Key key, this.showDesc = true, this.hasDivider = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReminderState();
  }
}

class _ReminderState extends BaseState<ReminderLayout> {
  var remindBuy = false;
  var remindUsed = false;
  final RemindCalendarProvider _remindCalenderProvider =
      RemindCalendarProvider();

  chooseCalendar() {
    push(RemindSetTimeScreen()).then((value) =>
        _remindCalenderProvider.setNewRemindCalendar(timeStart: value));
  }

  chooseDate() {
    push(RemindSetDateScreen()).then((value) =>
        _remindCalenderProvider.setNewRemindCalendar(dateStart: value));
  }

  Widget listViewRemindTime() {
    List<int> order = [1, 2, 3, 4];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(order.length, (index) {
        return _chooseRemindTime(
            S.of(context).reminderTimeAt(order[index].toString() + ':'), index);
      }),
    );
  }

  Widget _chooseRemindTime(String label, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: SizeUtil.normalSpace),
      child: Row(children: <Widget>[
        Text(
          label,
          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
        ),
        Padding(
          padding: const EdgeInsets.only(left: SizeUtil.tinySpace),
          child: GestureDetector(
            onTap: () {
              switch (index) {
                case 1:
                  break;
                case 2:
                case 3:

                case 4:
              }
              chooseCalendar();
            },
            child: Text(
              S.of(context).select,
              style: TextStyle(
                  fontSize: SizeUtil.textSizeSmall, color: Colors.orange),
            ),
          ),
        ),
      ]),
    );
  }

  Widget rowSelectRemindType(String title, {bool isRemindUse = false}) {
    return Consumer<RemindAddProvider>(
        builder: (BuildContext context, RemindAddProvider value, Widget child) {
      return Row(
        children: <Widget>[
          Radio(
            onChanged: (val) {
              value.setSelectedRadio(val);
            },
            groupValue: value.selectedRadio,
            value: isRemindUse ? 2 : 1,
            activeColor: ColorUtil.primaryColor,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      );
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.showDesc
            ? Padding(
                padding: SizeUtil.normalPadding,
                child: Text(S.of(context).selectRemindBuyTime,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeBigger,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.darkGray)))
            : SizedBox(),
        rowSelectRemindType(S.of(context).remindBuyProduct),
        GestureDetector(
          onTap: () {
            push(RemindSetTimeScreen());
          },
          child: rowTimeTable(S.of(context).remindTime),
        ),
        getDivider(),
        rowSelectRemindType(S.of(context).remindUseProduct, isRemindUse: true),
        GestureDetector(
          onTap: () {
            chooseDate();
          },
          child: rowTimeTable(S.of(context).endDateOfReminder),
        ),
        Padding(
            padding: const EdgeInsets.only(left: SizeUtil.hugSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: SizeUtil.midSpace, bottom: SizeUtil.tinySpace),
                  child: Row(
                    children: <Widget>[
                      Text(
                        S.of(context).reminderCycle,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeUtil.textSizeSmall),
                      ),
                      Text('*', style: TextStyle(color: Colors.red)),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: SizeUtil.tinySpace),
                        child: GestureDetector(
                          onTap: () {
                            push(RemindCycleScreen());
                          },
                          child: Text(
                            S.of(context).select,
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: Colors.orange),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                    TextSpan(
                      text: S.of(context).reminderCycleHint,
                    )
                  ],
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                      color: ColorUtil.textHint),
                )),
                listViewRemindTime(),
              ],
            )),
      ],
    );
  }

  rowTimeTable(String title) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: SizeUtil.hugSpace, right: SizeUtil.normalSpace),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: SizeUtil.textSizeSmall),
          ),
        ),
        SvgIcon(
          'timetable.svg',
          color: Colors.orange,
          width: SizeUtil.iconSize,
          height: SizeUtil.iconSize,
        ),
      ],
    );
  }

  Widget getDivider() {
    return widget.hasDivider
        ? Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: SizeUtil.smallSpace),
            child: CustomPaint(
              painter: DashedLine(
                  color: ColorUtil.primaryColor,
                  dashSpace: 5,
                  width: MediaQuery.of(context).size.width * 0.75),
            ),
          )
        : SizedBox();
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _remindCalenderProvider)];
  }
}
