import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/notify/widget/switch_button_title.dart';
import 'package:baby_garden_flutter/screen/setting/provider/switch_provider.dart';
import 'package:baby_garden_flutter/screen/setting/view_model/setting_screen_view_model.dart';
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

class _SettingScreenState
    extends BaseStateModel<SettingScreen, SettingScreenViewModel> {
  final SwitchProvider _settingProvider = new SwitchProvider();
  final ValueNotifier<bool> valueController1 = new ValueNotifier(false);
  List<dynamic> settings = List();

  @override
  void didChangeDependencies() {
    settings = [
      {
        "title": S.of(context).setting_1,
        "settingType":
            ShareValueProvider.shareValueProvider.setting_notify_product
      },
      {
        "title": S.of(context).setting_2,
        "settingType": ShareValueProvider
            .shareValueProvider.setting_notify_like_product_change
      },
      {
        "title": S.of(context).setting_3,
        "settingType":
            ShareValueProvider.shareValueProvider.setting_notify_service
      },
      {
        "title": S.of(context).setting_4,
        "settingType":
            ShareValueProvider.shareValueProvider.setting_notify_vcb_express
      },
    ];
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).setting,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset("photo/logo.png",
                width: MediaQuery.of(context).size.width * 4 / 16),
            HoboText(fontSize: SizeUtil.textSizeBigger),
            SizedBox(
              height: SizeUtil.bigSpace,
            ),
            Column(
              children: settings
                  .map((e) => Column(
                        children: <Widget>[
                          SwitchButtonTitle(
                            onChange: (val) {
                              getViewModel().onUpdateSetting(
                                  val, settings.indexOf(e) + 1);
                            },
                            settingType: e['settingType'],
                            title: e["title"],
                          ),
                          WidgetUtil.getLine(
                              margin: EdgeInsets.only(
                                  left: SizeUtil.defaultSpace,
                                  right: SizeUtil.defaultSpace),
                              color: ColorUtil.gray),
                        ],
                      ))
                  .toList(),
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

  @override
  SettingScreenViewModel initViewModel() {
    // TODO: implement initViewModel
    return new SettingScreenViewModel(context);
  }
}
