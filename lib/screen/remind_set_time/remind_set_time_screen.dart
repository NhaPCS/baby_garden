import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class RemindSetTimeScreen extends StatefulWidget {
  @override
  _RemindSetTimeScreenState createState() => _RemindSetTimeScreenState();
}

class _RemindSetTimeScreenState extends BaseState<RemindSetTimeScreen> {
  var _selectedTime = DateTime.now();

  @override
  Widget buildWidget(BuildContext context) {
    String buttonTitle = S.of(context).confirm;
    return Scaffold(
        appBar: getAppBar(title: S.of(context).selectRemindTime),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: SizeUtil.midSmallSpace),
                    width: double.infinity,
                    decoration: setBorder('top', Color(0xffE1D9D9), 1),
                    padding: SizeUtil.defaultPadding,
                    child: Text(
                      S.of(context).selectRemindTime,
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: setBorder('top', Color(0xffE4E4E4), 6),
                    padding: EdgeInsets.only(top: SizeUtil.defaultSpace),
                    height: MediaQuery.of(context).size.height / 2,
                    child: Theme(
                      data: ThemeData(
                          cupertinoOverrideTheme: CupertinoThemeData(
                              barBackgroundColor: Colors.green,
                              scaffoldBackgroundColor: Colors.grey,
                              textTheme: CupertinoTextThemeData(
                                pickerTextStyle: TextStyle(
                                    color: Colors.orange,
                                    fontSize: SizeUtil.textSizeLogo),
                                navActionTextStyle:
                                    TextStyle(color: Colors.orange),
                                dateTimePickerTextStyle: TextStyle(
                                  fontSize: SizeUtil.textSizeItemPost,
                                  color: Colors.orange,
                                ),
                              ))),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: _selectedTime,
                        use24hFormat: true,
                        onDateTimeChanged: (chosenTime) {
                          this._selectedTime = chosenTime;
                        },
                      ),
                    ),
                  ),
                  WidgetUtil.getLine(color: Color(0xffE4E4E4), width: 6),
                ],
              ),
            ),
          ],
        ),
    bottomNavigationBar: Padding(
      padding: SizeUtil.normalPadding,
      child: MyRaisedButton(
          padding: SizeUtil.smallPadding,
          text: buttonTitle,
          textStyle: TextStyle(
              fontSize: SizeUtil.textSizeBigger,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          color: ColorUtil.primaryColor,
          borderRadius: SizeUtil.tinyRadius,
          matchParent: true,
          onPressed: () {
            Navigator.of(context).pop(_selectedTime);
          }),
    ),);
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
