import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/remind_cycle/remind_cycle_screen.dart';
import 'package:baby_garden_flutter/screen/remind_set_date/remind_set_date_screen.dart';
import 'package:baby_garden_flutter/screen/remind_set_date_time/remind_set_date_time_screen.dart';
import 'package:baby_garden_flutter/screen/remind_set_time/remind_set_time_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/line/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

typedef ReminderSelectCallBack = void Function(
    int type,
    DateTime buyTime,
    DateTime endTime,
    int period,
    DateTime time1,
    DateTime time2,
    DateTime time3,
    DateTime time4);

class ReminderLayout extends StatefulWidget {
  final bool showDesc;
  final bool hasDivider;
  final ReminderSelectCallBack reminderSelectCallBack;

  const ReminderLayout(
      {Key key,
      this.showDesc = true,
      this.hasDivider = false,
      this.reminderSelectCallBack})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReminderState();
  }
}

class _ReminderState extends BaseState<ReminderLayout> {
  var remindBuy = false;
  var remindUsed = false;
  final ValueNotifier<int> _typeController = ValueNotifier(1);
  final ValueNotifier<DateTime> _buyDateController = ValueNotifier(null);
  final ValueNotifier<DateTime> _endDateController = ValueNotifier(null);
  final ValueNotifier<int> _periodDateController = ValueNotifier(null);
  final ValueNotifier<DateTime> _time1Controller = ValueNotifier(null);
  final ValueNotifier<DateTime> _time2Controller = ValueNotifier(null);
  final ValueNotifier<DateTime> _time3Controller = ValueNotifier(null);
  final ValueNotifier<DateTime> _time4Controller = ValueNotifier(null);

  Widget listViewRemindTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(4, (index) {
        return _chooseRemindTime(
            S.of(context).reminderTimeAt((index + 1).toString() + ':'), index);
      }),
    );
  }

  Widget _chooseRemindTime(String label, int index) {
    ValueNotifier<DateTime> notifier;
    switch (index) {
      case 0:
        notifier = _time1Controller;
        break;
      case 1:
        notifier = _time2Controller;
        break;
      case 2:
        notifier = _time3Controller;
        break;
      case 3:
        notifier = _time4Controller;
        break;
    }
    return Padding(
      padding: const EdgeInsets.only(top: SizeUtil.normalSpace),
      child: Row(children: <Widget>[
        Text(
          label,
          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
        ),
        ValueListenableBuilder<DateTime>(
          valueListenable: notifier,
          builder: (BuildContext context, DateTime value, Widget child) {
            return value == null
                ? SizedBox()
                : Text(
                    "   ${DateUtil.formatTime(value)}   ",
                    style: TextStyle(color: ColorUtil.primaryColor),
                  );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: SizeUtil.tinySpace),
          child: GestureDetector(
            onTap: () async {
              DateTime time = await push(RemindSetTimeScreen());
              switch (index) {
                case 0:
                  _time1Controller.value = time;
                  break;
                case 1:
                  _time2Controller.value = time;
                  break;
                case 2:
                  _time3Controller.value = time;
                  break;
                case 3:
                  _time4Controller.value = time;
                  break;
              }
              updateCallBack();
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

  Widget rowSelectRemindType(String title, int type) {
    return ValueListenableBuilder<int>(
      builder: (BuildContext context, int selectedType, Widget child) {
        return Row(
          children: <Widget>[
            Radio(
              onChanged: (val) {
                _typeController.value = val;
                updateCallBack();
              },
              value: type,
              activeColor: ColorUtil.primaryColor,
              groupValue: selectedType,
            ),
            Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
      valueListenable: _typeController,
    );
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
        rowSelectRemindType(S.of(context).remindBuyProduct, 1),
        InkWell(
          onTap: () async {
            DateTime date = await push(RemindSetDateTimeScreen());
            _buyDateController.value = date;
            updateCallBack();
          },
          child: ValueListenableBuilder<DateTime>(
            builder: (BuildContext context, DateTime value, Widget child) {
              return rowTimeTable(S.of(context).remindTime,
                  DateUtil.formatNormalDateTime(value));
            },
            valueListenable: _buyDateController,
          ),
        ),
        getDivider(),
        rowSelectRemindType(S.of(context).remindUseProduct, 2),
        InkWell(
          onTap: () async {
            DateTime date = await push(RemindSetDateScreen());
            _endDateController.value = date;
            updateCallBack();
          },
          child: ValueListenableBuilder<DateTime>(
            builder: (BuildContext context, DateTime value, Widget child) {
              return rowTimeTable(S.of(context).endDateOfReminder,
                  DateUtil.formatNormalDate(value));
            },
            valueListenable: _endDateController,
          ),
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
                      ValueListenableBuilder<int>(
                        valueListenable: _periodDateController,
                        builder:
                            (BuildContext context, int value, Widget child) {
                          return value == null
                              ? SizedBox()
                              : Text(
                                  "  ${value.toString()} ngày ",
                                  style:
                                      TextStyle(color: ColorUtil.primaryColor),
                                );
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: SizeUtil.tinySpace),
                        child: InkWell(
                          onTap: () async {
                            int period = await push(RemindCycleScreen());
                            _periodDateController.value = period;
                            updateCallBack();
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

  rowTimeTable(String title, String time) {
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
        time == null
            ? SizedBox()
            : Text(
                "$time   ",
                style: TextStyle(color: ColorUtil.primaryColor),
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

  void updateCallBack() {
    widget.reminderSelectCallBack(
        _typeController.value,
        _buyDateController.value,
        _endDateController.value,
        _periodDateController.value,
        _time1Controller.value,
        _time2Controller.value,
        _time3Controller.value,
        _time4Controller.value);
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
