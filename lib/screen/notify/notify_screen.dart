import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/notify_switch_provider.dart';
import 'package:baby_garden_flutter/provider/search_notify_provider.dart';
import 'package:baby_garden_flutter/provider/segment_control_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:baby_garden_flutter/widget/notify_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class NotifyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NotifyScreenState();
  }
}

class _NotifyScreenState extends BaseState<NotifyScreen> {
  final SegmentControlProvider _segmentControlProvider = new SegmentControlProvider();
  final TextEditingController searchTextController = new TextEditingController();
  final NotifySearchProvider _notifySearchProvider = new NotifySearchProvider();
  final NotifySwitchProvider _notifySwitchProvider = new NotifySwitchProvider();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      print(" initState " + _focusNode.hasFocus.toString());
      _notifySearchProvider.onChangeFocus(_focusNode.hasFocus);
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
        appBar: getAppBar(
          title: S.of(context).notify,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Consumer<SegmentControlProvider>(
              builder: (BuildContext context, SegmentControlProvider value,
                  Widget child) {
                return CupertinoSegmentedControl(
                  children: {
                    0: Text(S.of(context).sale),
                    1: Text(S.of(context).personal)
                  },
                  onValueChanged: (value) {
                    _segmentControlProvider.onSegmentChange(value);
                  },
                  groupValue: value.currentValue,
                  selectedColor: ColorUtil.primaryColor,
                  borderColor: ColorUtil.primaryColor,
                  padding: const EdgeInsets.only(
                      left: SizeUtil.biggerSpace,
                      right: SizeUtil.biggerSpace,
                      top: SizeUtil.smallSpace,
                      bottom: 0),
                );
              },
            ),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    //todo search notify
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: SizeUtil.midSmallSpace,bottom: SizeUtil.midSmallSpace,right: SizeUtil.midSmallSpace,top: SizeUtil.midSmallSpace),
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: <Widget>[
                              MyTextField(
                                textStyle:
                                    TextStyle(fontSize: SizeUtil.textSizeSmall),
                                elevation: SizeUtil.defaultElevation,
                                textEditingController: searchTextController,
                                maxLines: 1,
                                borderRadius: SizeUtil.bigRadius,
                                hint: S.of(context).notify_hint_search,
                                contentPadding: EdgeInsets.only(
                                    left: SizeUtil.notifyHintSpace,
                                    right: SizeUtil.smallSpace,
                                    top: SizeUtil.smallSpace,
                                    bottom: SizeUtil.smallSpace),
                                borderColor: Colors.white,
                                ontap: () {
                                  _notifySearchProvider.onChangeFocus(true);
                                },
                                onFocus: _focusNode,
                                onChanged: (text) {
                                  if (text.trim().length > 0)
                                    _notifySearchProvider.onChangeFocus(true);
                                  else {
                                    _notifySearchProvider.onChangeFocus(false);
                                  }
                                },
                              ),
                              Positioned(
                                child: Icon(
                                  CupertinoIcons.search,
                                  color: ColorUtil.textHint,
                                  size: SizeUtil.iconSize,
                                ),
                                left: SizeUtil.smallSpace,
                              ),
                            ],
                          ),
                        )),
                        Consumer<NotifySearchProvider>(
                          builder: (BuildContext context,
                              NotifySearchProvider value, Widget child) {
                            return !value.isFocus
                                ? Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(
                                        left: SizeUtil.normalSpace),
                                    child: Row(
                                      children: <Widget>[
                                        InkWell(
                                          child: Text(
                                            S.of(context).hide_readed_notify,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: SizeUtil.textSizeSmall),
                                          ),
                                          onTap: (){
                                            _notifySwitchProvider.onChange();
                                          },
                                        ),
                                        Consumer<NotifySwitchProvider>(builder: (BuildContext context, NotifySwitchProvider value, Widget child) {
                                          return Transform.scale(
                                            scale: 1,
                                            child: Switch(
                                              value: value.isEnable,
                                              onChanged: (bool newValue) {
                                                _notifySwitchProvider.onChange();
                                              },
                                              activeColor: ColorUtil.primaryColor,
                                              inactiveThumbColor: ColorUtil.gray,
                                            ),
                                          );
                                        },),
                                      ],
                                    ))
                                : SizedBox(
                                    width: 10,
                                  );
                          },
                        ),
                      ],
                    ),
                    //todo notify list
                    Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            return new NotifyItem();
                          }),
                    )
                  ],
                ),
                color: ColorUtil.lineColor,
              ),
            )
          ],
        )));
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [
      ChangeNotifierProvider.value(value: _segmentControlProvider),
      ChangeNotifierProvider.value(value: _notifySearchProvider),
      ChangeNotifierProvider.value(value: _notifySwitchProvider),
    ];
  }
}
