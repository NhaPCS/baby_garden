import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/segment_control_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:baby_garden_flutter/widget/search_bar.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final SegmentControlProvider _segmentControlProvider =
      new SegmentControlProvider();
  final TextEditingController searchTextController =
      new TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).notify,
        centerTitle: true,
        bgColor: Colors.white,
        titleColor: ColorUtil.primaryColor,
        backColor: ColorUtil.primaryColor,
      ),
      body: Center(
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
                      top: 0,
                      bottom: 0),
                );
              },
            ),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            Container(
              child: Expanded(
                flex: 1,
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Stack(
                          alignment: Alignment.centerLeft,
                          children: <Widget>[
                            MyTextField(
                              textStyle:
                                  TextStyle(fontSize: SizeUtil.textSizeSmall),
                              elevation: SizeUtil.defaultElevation,
                              textEditingController: searchTextController,
                              borderRadius: SizeUtil.bigRadius,
                              hint: S.of(context).notify_hint_search,
                              contentPadding: EdgeInsets.only(
                                  left: SizeUtil.notifyHintSpace,
                                  right: SizeUtil.tinySpace,
                                  top: SizeUtil.smallSpace,
                                  bottom: SizeUtil.smallSpace),
                              borderColor: Colors.white,
                            ),
                            Positioned(
                              child: Icon(
                                CupertinoIcons.search,
                                color: ColorUtil.textHint,
                              ),
                              left: SizeUtil.smallSpace,
                            ),
                          ],
                        )),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 130,
                          child: new SwitchListTile(
                            value: true,
                            onChanged: (bool newValue) {},
                            title: Text(
                              S.of(context).hide_readed_notify,
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                            ),
                            contentPadding:
                            const EdgeInsets.only(right: 0, left: 5),
                            activeColor: ColorUtil.primaryColor,
                            inactiveThumbColor: ColorUtil.gray,
                          ),
                        )
                      ],
                    ),
                    Container(color: ColorUtil.primaryColor,height: 50,width: 50,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _segmentControlProvider)];
  }
}
