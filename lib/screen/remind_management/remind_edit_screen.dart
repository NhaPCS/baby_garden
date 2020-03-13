import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/remind_management/remind_add_screen.dart';
import 'package:baby_garden_flutter/screen/remind_management/remind_management_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../base_state.dart';
import 'remindCard.dart';

class RemindEditScreen extends StatefulWidget {
  @override
  _RemindEditScreen createState() => _RemindEditScreen();
}

class _RemindEditScreen extends BaseState<RemindEditScreen> {
  final GetListProvider _getListProvider = GetListProvider();

  final remind1 = RemindCard(
    displayIcon: false,
    image: "photo/sample_product.png",
    description:
        "Sữa bột Glico Nhật Bản số 0-1 dành cho trẻ từ sơ sinh đến 1 tuổi",
    price: "900.000",
    datetime: "12.01.2020 - 08:00",
    remindType: RemindType.remindBuy,
  );

  var chosenDate = DateTime.now();
  var chosenTime;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.add_circle,
                  size: SizeUtil.iconSizeBigger, color: Colors.white),
              onPressed: () {
                RouteUtil.push(context, RemindAddScreen());
              },
            ),
          ],
          title: S.of(context).editReminder,
        ),
        body: Column(children: <Widget>[
          Container(child: remind1),
          Container(
            padding: EdgeInsets.only(left: SizeUtil.smallSpace, top: 13.5),
            width: double.infinity,
            height: SizeUtil.hugSpace,
            child: Text(
              S.of(context).selectRemindBuyTime,
              style: TextStyle(
                  color: ColorUtil.darkGray, fontWeight: FontWeight.bold),
            ),
          ),
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
              Text(
                this.chosenDate.toString(),
                style: TextStyle(
                    color: ColorUtil.darkGray,
                    fontSize: SizeUtil.textSizeBigger),
              ),
              Expanded(
                child: SizedBox(),
              ),
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
                          right: SizeUtil.smallSpace,
                          left: SizeUtil.smallSpace),
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
                    child: CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hm,
                      onTimerDurationChanged: (chosenTime) {
                        print(chosenTime);
                        this.chosenTime = chosenTime;
                      },
                    ),
                  ),
                ],
              ),
            ),
            height: 250,
            decoration:
                setBorder('bottom', Color(0xffE4E4E4), SizeUtil.lineHeight),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: SizeUtil.normalPadding,
                    child: ButtonTheme(
                      buttonColor: ColorUtil.primaryColor,
                      padding: SizeUtil.normalPadding,
                      minWidth: double.infinity,
                      height: SizeUtil.biggerSpace,
                      child: RaisedButton(
                        padding: SizeUtil.normalPadding,
                        onPressed: () {
                          RouteUtil.push(context, RemindManagementScreen());
                        },
                        child: Text(
                          S.of(context).saveChange,
                          style: TextStyle(fontSize: SizeUtil.textSizeBigger),
                        ),
                        textColor: Colors.white,
                      ),
                    ),
                  )))
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }

  void selectDate() {
    Future<DateTime> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    setState(() {
      selectedDate.then((value) => this.chosenDate = value);
    });
  }
}
