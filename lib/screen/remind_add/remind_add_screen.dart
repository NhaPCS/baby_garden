import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/remind_management/provider/remind_calendar_provider.dart';
import 'package:baby_garden_flutter/screen/remind_management/widget/reminder_layout.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../base_state.dart';

// TODO-QAnh:screen đặt ở folder riêng, khong de chung trong 1 folder
class RemindAddScreen extends StatefulWidget {
  @override
  _RemindAddScreen createState() => _RemindAddScreen();
}

class _RemindAddScreen extends BaseState<RemindAddScreen> {
  var remindBuy = false;
  var remindUsed = false;
  RemindCalendarProvider remindCalenderProvider = RemindCalendarProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          title: S.of(context).remindManage,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: setBorder('bottom', ColorUtil.darkGray, 1),
                padding: const EdgeInsets.all(SizeUtil.smallSpace),
                height: SizeUtil.hugSpace,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add,
                        color: ColorUtil.primaryColor,
                        size: SizeUtil.iconSizeBig),
                    // TODO-QAnh: thay Padding = SizeBox(width:) cho đỡ lồng view
                    Padding(
                      padding: const EdgeInsets.only(left: SizeUtil.smallSpace),
                      child: Text(S.of(context).selectRemindProduct,
                          style: TextStyle(
                              color: ColorUtil.darkGray,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              // TODO-QAnh:xem lai doan nay dang bi thieu Pixel
              Expanded(
                child: ReminderLayout(),
              ),
              // TODO-QAnh: button dung MyRaisedButton
              Container(
                padding: SizeUtil.normalPadding,
                child: ButtonTheme(
                  buttonColor: ColorUtil.primaryColor,
                  padding: SizeUtil.normalPadding,
                  minWidth: double.infinity,
                  height: SizeUtil.biggerSpace,
                  child: RaisedButton(
                    padding: SizeUtil.normalPadding,
                    onPressed: () {
                      if (!validateInput()) return;

                      remindCalenderProvider.addNewCalendar(context);
                    },
                    child: Text(
                      S.of(context).addReminder,
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
    return [];
  }

  bool validateInput() {
    // add more condition after
    return remindCalenderProvider.newRemindCalendar.productId != null;
  }
}
