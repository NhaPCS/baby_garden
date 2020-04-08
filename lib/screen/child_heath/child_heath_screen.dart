import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_index_provider.dart';
import 'package:baby_garden_flutter/provider/change_mode_enter_heath_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/child_heath/enter_weight_height.dart';
import 'package:baby_garden_flutter/screen/child_heath/select_child_dropdow.dart';
import 'package:baby_garden_flutter/screen/child_heath/view_weight_height.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
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
  final ChangeIndexProvider _changeIndexProvider = ChangeIndexProvider();

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
            leading: SizedBox(
              width: 0,
            ),
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
                SelectChildDropDown()
              ],
            ),
            bottom: PreferredSize(
                child: Consumer<ChangeModeEnterHeathProvider>(
                  builder: (BuildContext context,
                      ChangeModeEnterHeathProvider value, Widget child) {
                    if (value.isEntering) return SizedBox();
                    return Consumer<ChangeIndexProvider>(
                      builder: (BuildContext context, ChangeIndexProvider value,
                          Widget child) {
                        return Row(
                          children: <Widget>[
                            getTab(text: S.of(context).height, index: 0),
                            getTab(text: S.of(context).weight, index: 1)
                          ],
                        );
                      },
                    );
                  },
                ),
                preferredSize: Size.fromHeight(60)),
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

  Widget getTab({String text, int index}) {
    return Expanded(
        child: InkWell(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(
              left: SizeUtil.defaultSpace, right: SizeUtil.defaultSpace),
          alignment: Alignment.center,
          padding: SizeUtil.smallPadding,
          decoration: BoxDecoration(
              color: _changeIndexProvider.index == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Text(
            text,
            style: TextStyle(
                color: _changeIndexProvider.index == index
                    ? ColorUtil.blueLight
                    : Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          _changeIndexProvider.changeIndex(index);
        },
      ),
    ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _changeModeEnterHeathProvider),
      ChangeNotifierProvider.value(value: _changeIndexProvider),
    ];
  }
}
