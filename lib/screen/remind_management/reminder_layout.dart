import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/remind_management/remind_set/set_time_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class ReminderLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReminderState();
  }
}

class _ReminderState extends BaseState<ReminderLayout> {
  var remindBuy = false;
  var remindUsed = false;

  chooseCalendar() {
    push(SetTimeScreen());
  }

  listViewRemindTime() {
    List<int> order = [1, 2, 3, 4];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(order.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(top: SizeUtil.normalSpace),
          child: Row(children: <Widget>[
            Text(
              S.of(context).reminderTimeAt(order[index].toString() + ':'),
              style: TextStyle(fontSize: SizeUtil.textSizeSmall),
            ),
            Padding(
              padding: const EdgeInsets.only(left: SizeUtil.tinySpace),
              child: GestureDetector(
                onTap: chooseCalendar(),
                child: Text(
                  S.of(context).select,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall, color: Colors.orange),
                ),
              ),
            ),
          ]),
        );
      }),
    );
  }

  rowCheckBox(String title, {bool isRemindUse = false}) {
    return Row(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.orange),
          child: Checkbox(
              value: isRemindUse ? this.remindUsed : this.remindBuy,
              onChanged: (bool value) {
                setState(() {
                  if (isRemindUse) {
                    this.remindUsed = !this.remindUsed;
                  } else {
                    this.remindBuy = !this.remindBuy;
                  }
                });
              }),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Text(S.of(context).selectRemindBuyTime,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeBigger,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.darkGray)),
              ],
            )),
        rowCheckBox(S.of(context).remindBuyProduct),
        GestureDetector(
          onTap: () {
            push(SetTimeScreen());
          },
          child: rowTimeTable(S.of(context).remindTime),
        ),
        rowCheckBox(S.of(context).remindUseProduct, isRemindUse: true),
        rowTimeTable(S.of(context).endDateOfReminder),
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
                          onTap: chooseCalendar(),
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
        ),
      ],
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
