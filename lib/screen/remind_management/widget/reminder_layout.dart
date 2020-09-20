import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/remind_cycle/remind_cycle_screen.dart';
import 'package:baby_garden_flutter/screen/remind_set_date/remind_set_date_screen.dart';
import 'package:baby_garden_flutter/screen/remind_set_time/remind_set_time_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/line/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

typedef ReminderSelectCallBack = void Function(
    RemindType type,
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
  final RemindCalendar remindCalendar;

  const ReminderLayout(
      {Key key,
      this.showDesc = true,
      this.hasDivider = false,
      this.reminderSelectCallBack,
      this.remindCalendar})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReminderState();
  }
}

class _ReminderState extends BaseState<ReminderLayout> {
  var remindBuy = false;
  var remindUsed = false;
  final ValueNotifier<List<bool>> _typeController =
      ValueNotifier([true, false]);
  final ValueNotifier<DateTime> _buyDateController = ValueNotifier(null);
  final ValueNotifier<DateTime> _endDateController = ValueNotifier(null);
  final ValueNotifier<int> _periodDateController = ValueNotifier(null);
  final ValueNotifier<DateTime> _time1Controller = ValueNotifier(null);
  final ValueNotifier<DateTime> _time2Controller = ValueNotifier(null);
  final ValueNotifier<DateTime> _time3Controller = ValueNotifier(null);
  final ValueNotifier<DateTime> _time4Controller = ValueNotifier(null);

  @override
  void initState() {
    if (widget.remindCalendar != null) {
      switch (widget.remindCalendar.type) {
        case RemindType.remindBuy:
          _typeController.value = [true, false];
          break;
        case RemindType.remindUse:
          _typeController.value = [false, true];
          break;
        case RemindType.all:
          _typeController.value = [true, true];
          break;
      }
      _buyDateController.value = DateUtil.getServerDate(
          widget.remindCalendar.dateStart, widget.remindCalendar.timeStart);
      _endDateController.value = DateUtil.getServerDate(
          widget.remindCalendar.dateEnd, widget.remindCalendar.timeEnd);
      if (widget.remindCalendar.period != null &&
          widget.remindCalendar.period.isNotEmpty)
        _periodDateController.value = int.parse(widget.remindCalendar.period);
      _time1Controller.value =
          DateUtil.getServerTime(widget.remindCalendar.time1);
      _time2Controller.value =
          DateUtil.getServerTime(widget.remindCalendar.time2);
      _time3Controller.value =
          DateUtil.getServerTime(widget.remindCalendar.time3);
      _time4Controller.value =
          DateUtil.getServerTime(widget.remindCalendar.time4);
    }
    super.initState();
  }

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
    return ValueListenableBuilder<DateTime>(
      valueListenable: notifier,
      builder: (BuildContext context, DateTime value, Widget child) {
        return Padding(
          padding: const EdgeInsets.only(top: SizeUtil.normalSpace),
          child: Row(children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: SizeUtil.textSizeSmall),
            ),
            value == null
                ? SizedBox()
                : Text(
                    "   ${DateUtil.formatTime(value)}   ",
                    style: TextStyle(color: ColorUtil.primaryColor),
                  ),
            Padding(
              padding: const EdgeInsets.only(left: SizeUtil.tinySpace),
              child: GestureDetector(
                onTap: () async {
                  if (notifier.value != null) {
                    notifier.value = null;
                    updateCallBack();
                    return;
                  }
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
                  notifier.value != null
                      ? S.of(context).remove_select
                      : S.of(context).select,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall, color: Colors.orange),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  Widget rowSelectRemindType(String title, int index) {
    return ValueListenableBuilder<List<bool>>(
      builder: (BuildContext context, List<bool> selectedTypes, Widget child) {
        return Row(
          children: <Widget>[
            CircleCheckbox(
              uncheckBg: Icons.check_box_outline_blank,
              checkBg: Icons.check_box,
              onChanged: (val) {
                selectedTypes[index] = val;
                _typeController.value = selectedTypes;
                print("VALUUUU ${_typeController.value}");
                updateCallBack();
              },
              checked: selectedTypes[index],
              activeColor: ColorUtil.primaryColor,
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
        rowSelectRemindType(S.of(context).remindBuyProduct, 0),
        InkWell(
          onTap: () async {
            DateTime date = await push(RemindSetDateScreen());
            _buyDateController.value = date;
            updateCallBack();
          },
          child: ValueListenableBuilder<DateTime>(
            builder: (BuildContext context, DateTime value, Widget child) {
              return rowTimeTable(
                  S.of(context).remindTime, DateUtil.formatNormalDate(value));
            },
            valueListenable: _buyDateController,
          ),
        ),
        rowSelectRemindType(S.of(context).remindUseProduct, 1),
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
                SizedBox(height: SizeUtil.midSpace),
                _cycleRow(),
                SizedBox(height: SizeUtil.tinySpace),
                _cycleHint(),
                listViewRemindTime(),
              ],
            )),
      ],
    );
  }

  Widget _cycleRow() {
    return Row(
      children: <Widget>[
        Text(
          S.of(context).reminderCycle,
          style:
              TextStyle(color: Colors.black, fontSize: SizeUtil.textSizeSmall),
        ),
        Text('*', style: TextStyle(color: Colors.red)),
        ValueListenableBuilder<int>(
          valueListenable: _periodDateController,
          builder: (BuildContext context, int value, Widget child) {
            return value == null
                ? SizedBox()
                : Text(
                    "  ${value.toString()} ngày ",
                    style: TextStyle(color: ColorUtil.primaryColor),
                  );
          },
        ),
        SizedBox(
          width: SizeUtil.tinySpace,
        ),
        InkWell(
          onTap: () async {
            int period = await push(RemindCycleScreen());
            _periodDateController.value = period;
            updateCallBack();
          },
          child: Text(
            S.of(context).select,
            style: TextStyle(
                fontSize: SizeUtil.textSizeSmall, color: Colors.orange),
          ),
        ),
      ],
    );
  }

  Widget _cycleHint() {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(text: '*', style: TextStyle(color: Colors.red)),
        TextSpan(
          text: S.of(context).reminderCycleHint,
        )
      ],
      style: TextStyle(
          fontSize: SizeUtil.textSizeSmall, color: ColorUtil.textHint),
    ));
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
        time.isEmpty
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
    RemindType remindType;
    if (_typeController.value[0] && _typeController.value[1]) {
      remindType = RemindType.all;
    } else if (_typeController.value[0]) {
      remindType = RemindType.remindBuy;
    } else if (_typeController.value[1]) {
      remindType = RemindType.remindUse;
    } else {
      remindType = RemindType.remindBuy;
      _typeController.value = [true, false];
      print("TYPE  ${remindType}");
    }

    widget.reminderSelectCallBack(
        remindType,
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
