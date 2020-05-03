import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/remind_management/provider/remind_calendar_provider.dart';
import 'package:baby_garden_flutter/screen/remind_management/widget/reminder_layout.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../base_state.dart';

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
                    SizedBox(width: SizeUtil.smallSpace),
                    Text(S.of(context).selectRemindProduct,
                        style: TextStyle(
                            color: ColorUtil.darkGray,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              // TODO-QAnh:xem lai doan nay dang bi thieu Pixel
              Expanded(
                child: ReminderLayout(),
              ),
              Padding(
                  padding: SizeUtil.normalPadding,
                  child: MyRaisedButton(
                    padding: SizeUtil.normalPadding,
                    borderRadius: SizeUtil.tinyRadius,
                    matchParent: true,
                    onPressed: () {
                      // TODO-QA: wait response from api team and complete

                      // test post
                      // remindCalenderProvider.newRemindCalendar = RemindCalendar(
                      // productId: 19,
                      // price: '300000',
                      // image:
                      //     'http:\/\/chap.com.vn\/vcb\/uploads\/product\/1.jpg","http:\/\/chap.com.vn\/vcb\/uploads\/product\/2.jpeg',
                      // description: 'Giày thời trang trẻ em',
                      // type: RemindType.remindBuy);

                      if (!validateInput()) return;
                      print('add new calendar');

                      remindCalenderProvider.addNewCalendar(context);
                    },
                    color: ColorUtil.primaryColor,
                    text: S.of(context).addReminder,
                    textStyle: TextStyle(
                        fontSize: SizeUtil.textSizeBigger, color: Colors.white),
                  ))
            ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: remindCalenderProvider)];
  }

  bool validateInput() {
    // add more condition after
    return remindCalenderProvider.newRemindCalendar.productId != null;
  }
}
