import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/setting/provider/switch_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/hobo_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingScreenState();
  }
}

class _SettingScreenState extends BaseState<SettingScreen> {
  // TODO-Hung: tạo widget riêng cho từng cái swicher, không dùng chung
  final SwitchProvider _settingProvider = new SwitchProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).setting,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white),
      // TODO-Hung: trong column center dc ma
      body: Center(
        // TODO-Hung: chuyển sang dùng ListView cũng đc.
        child: Column(
          children: <Widget>[
            Image.asset("photo/logo.png",
                width: MediaQuery.of(context).size.width *4/ 16),
            HoboText(fontSize: SizeUtil.textSizeBigger),
            SizedBox(height: SizeUtil.bigSpace,),
            Consumer<SwitchProvider>(
              builder:
                  (BuildContext context, SwitchProvider value, Widget child) {
                    // TODO-Hung: tạo widget riêng cho từng cái swicher, không dùng chung
                return SwitchListTile(
                  value: value.isSwitch1,
                  onChanged: (bool newValue) {
                    _settingProvider.onSwitch1(newValue);
                  },
                  title: Text(
                    S.of(context).setting_1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall, fontFamily: "hoho"),
                  ),
                  activeColor: ColorUtil.primaryColor,
                  inactiveThumbColor: ColorUtil.gray,
                );
              },
            ),
            // TODO-Hung: dung WidgetUtil.getLine
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: new EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: SizeUtil.tinySpace,
                  bottom: 0),
              color: ColorUtil.gray,
            ),
            Consumer<SwitchProvider>(
              builder:
                  (BuildContext context, SwitchProvider value, Widget child) {
                    // TODO-Hung: tạo widget riêng cho từng cái swicher, không dùng chung
                return SwitchListTile(
                  value: value.isSwitch2,
                  onChanged: (bool newValue) {
                    _settingProvider.onSwitch2(newValue);
                  },
                  title: Text(
                    // TODO-Hung: dat ten ro rang ra
                    S.of(context).setting_2,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall, fontFamily: "hoho"),
                  ),
                  activeColor: ColorUtil.primaryColor,
                  inactiveThumbColor: ColorUtil.gray,
                );
              },
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: new EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: SizeUtil.tinySpace,
                  bottom: 0),
              color: ColorUtil.gray,
            ),
            Consumer<SwitchProvider>(
              builder:
                  (BuildContext context, SwitchProvider value, Widget child) {
                return SwitchListTile(
                  value: value.isSwitch3,
                  onChanged: (bool newValue) {
                    _settingProvider.onSwitch3(newValue);
                  },
                  title: Text(
                    // TODO-Hung: dat ten ro rang ra
                    S.of(context).setting_3,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall, fontFamily: "hoho"),
                  ),
                  activeColor: ColorUtil.primaryColor,
                  inactiveThumbColor: ColorUtil.gray,
                );
              },
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: new EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: SizeUtil.tinySpace,
                  bottom: 0),
              color: ColorUtil.gray,
            ),
            Consumer<SwitchProvider>(
              builder:
                  (BuildContext context, SwitchProvider value, Widget child) {
                return SwitchListTile(
                  value: value.isSwitch4,
                  onChanged: (bool newValue) {
                    _settingProvider.onSwitch4(newValue);
                  },
                  title: Text(
                    // TODO-Hung: dat ten ro rang ra
                    S.of(context).setting_4,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall, fontFamily: "hoho"),
                  ),
                  activeColor: ColorUtil.primaryColor,
                  inactiveThumbColor: ColorUtil.gray,
                );
              },
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: new EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: SizeUtil.tinySpace,
                  bottom: 0),
              color: ColorUtil.gray,
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _settingProvider),
    ];
  }
}
