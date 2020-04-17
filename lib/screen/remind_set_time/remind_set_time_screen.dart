import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

// TODO-QAnh:screen đặt ở folder riêng, khong de chung trong 1 folder
class RemindSetTimeScreen extends StatefulWidget {
  @override
  _RemindSetTimeScreenState createState() => _RemindSetTimeScreenState();
}

class _RemindSetTimeScreenState extends BaseState<RemindSetTimeScreen> {

  @override
  Widget buildWidget(BuildContext context) {
    String buttonTitle = S.of(context).confirm;
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
                    S.of(context).selectRemindTime,
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )),
            Container(
              decoration: setBorder('top', Color(0xffE4E4E4), 6),
              padding: EdgeInsets.only(top: 20),
              height: 300,
              child: Theme(
                data: ThemeData(
                    cupertinoOverrideTheme: CupertinoThemeData(
                        barBackgroundColor: Colors.green,
                        scaffoldBackgroundColor: Colors.grey,
                        textTheme: CupertinoTextThemeData(
                          pickerTextStyle:
                              TextStyle(color: Colors.orange, fontSize: 20),
                          tabLabelTextStyle: TextStyle(fontSize: 80),
                          navLargeTitleTextStyle: TextStyle(fontSize: 50),
                          navActionTextStyle: TextStyle(color: Colors.orange),
                          navTitleTextStyle: TextStyle(fontSize: 40),
                          dateTimePickerTextStyle: TextStyle(
                            fontSize: 30,
                            color: Colors.orange,
                          ),
                        ))
                    // textSelectionColor: Colors.orange
                    ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: true,
                  // backgroundColor: Colors.orange,
                  onDateTimeChanged: (chosenTime) {},
                ),
              ),
            ),
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
    return [];
  }
}
