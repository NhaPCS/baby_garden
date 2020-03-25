import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_mode_enter_heath_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/child_heath/enter_weight_height.dart';
import 'package:baby_garden_flutter/screen/child_heath/view_weight_height.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/chart/child_chart.dart';
import 'package:baby_garden_flutter/widget/circle_image.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'check_child_info_dialog.dart';

class ChildHeathScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChildHeathState();
  }
}

class _ChildHeathState extends BaseState<ChildHeathScreen> {
  final ChangeModeEnterHeathProvider _changeModeEnterHeathProvider =
      ChangeModeEnterHeathProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: S.of(context).weight_height),
      body: NestedScrollView(headerSliverBuilder: (context, isScrollInner) {
        return [
          SliverAppBar(
            floating: true,
            elevation: 0,
            backgroundColor: ColorUtil.primaryColor,
            leading: SizedBox(width: 0,),
            expandedHeight: Provider.of<AppProvider>(context).childHeightBar,
            flexibleSpace: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: SizeUtil.defaultSpace,
                    ),
                    Column(
                      children: <Widget>[
                        SvgIcon(
                          'girl.svg',
                          width: SizeUtil.iconSizeLarge,
                        ),
                        Text(
                          S.of(context).girl,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      width: SizeUtil.defaultSpace,
                    ),
                    Expanded(
                      child: Center(
                        child: CircleImage(
                          width: 100,
                          height: 100,
                          imageUrl: StringUtil.dummyImage,
                          borderRadius: SizeUtil.smallRadius,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeUtil.defaultSpace,
                    ),
                    Column(
                      children: <Widget>[
                        SvgIcon(
                          'birthday_cake.svg',
                          width: SizeUtil.iconSizeLarge,
                        ),
                        Text(
                          S.of(context).girl,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      width: SizeUtil.defaultSpace,
                    ),
                  ],
                ),
                Expanded(
                    child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SvgIcon(
                      'btn_rounded_orange.svg',
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: SizeUtil.smallSpace, top: SizeUtil.tinySpace),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          Text(
                            "Âu Vũ Ngân Giang",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
            bottom: PreferredSize(child: Consumer<ChangeModeEnterHeathProvider>(builder: (BuildContext context, ChangeModeEnterHeathProvider value, Widget child) {
              if(value.isEntering) return SizedBox();
              return Row(
                children: <Widget>[
                  getTab(S.of(context).height, true),
                  getTab(S.of(context).weight, false)
                ],
              );
            },), preferredSize: Size.fromHeight(60)),
          ),
        ];
      }, body: Consumer<ChangeModeEnterHeathProvider>(
        builder: (BuildContext context, ChangeModeEnterHeathProvider value,
            Widget child) {
          if (value.isEntering)
            return EnterWeightHeight(
              onDoneEnter: () {
                _changeModeEnterHeathProvider.changeMode(false);
              },
            );
          return ViewWeightHeight();
        },
      )),
      bottomNavigationBar: Padding(
        padding: SizeUtil.normalPadding,
        child: MyRaisedButton(
          onPressed: () {
            if (_changeModeEnterHeathProvider.isEntering) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CheckChildInfoDialog(onDonePress: () {
                      _changeModeEnterHeathProvider.changeMode(false);
                    });
                  });
            }
            _changeModeEnterHeathProvider.changeMode(true);
          },
          color: ColorUtil.primaryColor,
          text: S.of(context).enter_weight_height.toUpperCase(),
          textStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          padding: SizeUtil.smallPadding,
        ),
      ),
    );
  }

  Widget getTab(String text, bool isSelected) {
    return Expanded(
        child: InkWell(
      child: Container(
        margin: EdgeInsets.only(
            left: SizeUtil.defaultSpace, right: SizeUtil.defaultSpace),
        alignment: Alignment.center,
        padding: SizeUtil.smallPadding,
        decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Text(
          text,
          style: TextStyle(
              color: isSelected ? ColorUtil.blueLight : Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _changeModeEnterHeathProvider)];
  }
}
