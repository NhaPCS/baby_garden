import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingScreenState();
  }
}

class _SettingScreenState extends BaseState<SettingScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
          title: S
              .of(context)
              .setting,
          centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset("photo/logo.png",
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 3),
            Text(S
                .of(context)
                .app_name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeLogo, fontFamily: "hobo")),
            SizedBox(),
            new SwitchListTile(
              value: true,
              onChanged: (bool newValue) {},
              title: Text(
                S
                    .of(context)
                    .setting_1,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall, fontFamily: "hoho"),
              ),
              activeColor: ColorUtil.primaryColor,
              inactiveThumbColor: ColorUtil.gray,
            ),
            Container(
              height: 1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: new EdgeInsets.only(left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: SizeUtil.tinySpace, bottom: 0),
              color: ColorUtil.gray,
            ),
            new SwitchListTile(
              value: true,
              onChanged: (bool newValue) {},
              title: Text(
                S
                    .of(context)
                    .setting_2,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall, fontFamily: "hoho"),
              ),
              activeColor: ColorUtil.primaryColor,
              inactiveThumbColor: ColorUtil.gray,
            ),
            Container(
              height: 1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: new EdgeInsets.only(left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: SizeUtil.tinySpace, bottom: 0),
              color: ColorUtil.gray,
            ),
            new SwitchListTile(
              value: true,
              onChanged: (bool newValue) {},
              title: Text(
                S
                    .of(context)
                    .setting_3,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall, fontFamily: "hoho"),
              ),
              activeColor: ColorUtil.primaryColor,
              inactiveThumbColor: ColorUtil.gray,
            ),
            Container(
              height: 1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: new EdgeInsets.only(left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: SizeUtil.tinySpace, bottom: 0),
              color: ColorUtil.gray,
            ),
            new SwitchListTile(
              value: true,
              onChanged: (bool newValue) {},
              title: Text(
                S
                    .of(context)
                    .setting_4,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall, fontFamily: "hoho"),
              ),
              activeColor: ColorUtil.primaryColor,
              inactiveThumbColor: ColorUtil.gray,
            ),
            Container(
              height: 1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: new EdgeInsets.only(left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: SizeUtil.tinySpace, bottom: 0),
              color: ColorUtil.gray,
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return null;
  }
}
