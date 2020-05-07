import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/notify_control_provider.dart';
import 'package:baby_garden_flutter/screen/notify/provider/search_notify_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/order_detail/order_detail_screen.dart';
import 'package:baby_garden_flutter/screen/saling_detail/sailing_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/switchButton.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:baby_garden_flutter/screen/notify/item/notify_item.dart';
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
  final TextEditingController searchTextController =
      new TextEditingController();
  final NotifySearchProvider _notifySearchProvider = new NotifySearchProvider();
  final ValueNotifier<bool> _hideReadNotifyController =
      new ValueNotifier(false);
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
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
            Consumer<NotifyProvider>(
              builder:
                  (BuildContext context, NotifyProvider value, Widget child) {
                return CupertinoSegmentedControl(
                  children: {
                    0: Text(S.of(context).sale),
                    1: Text(S.of(context).personal)
                  },
                  onValueChanged: (value) {
                    Provider.of<NotifyProvider>(context, listen: false)
                        .onSegmentChange(value);
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
                          padding: const EdgeInsets.only(
                              left: SizeUtil.midSmallSpace,
                              bottom: SizeUtil.midSmallSpace,
                              right: SizeUtil.midSmallSpace,
                              top: SizeUtil.midSmallSpace),
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
                                  Provider.of<NotifyProvider>(context,listen: false).onSearch(text);
                                  if (text.trim().length > 0) {
                                    _notifySearchProvider.onChangeFocus(true);
                                  } else {
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
                                                fontSize:
                                                    SizeUtil.textSizeSmall),
                                          ),
                                          onTap: () {
                                            _hideReadNotifyController.value =
                                                !_hideReadNotifyController
                                                    .value;
                                          },
                                        ),
                                        Transform.scale(
                                          scale: 1,
                                          child: SwitchButton(
                                            valueChanged: (result) {
                                              Provider.of<NotifyProvider>(context).onHideReadNotify(result);
                                              _hideReadNotifyController.value =
                                                  result;
                                            },
                                            valueController:
                                                _hideReadNotifyController,
                                          ),
                                        )
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
                    Consumer<NotifyProvider>(
                      builder: (BuildContext context, NotifyProvider value,
                          Widget child) {
                        List<dynamic> data = value.getData();
                        print("data $data ${value.isPromote}");
                        if (data == null || data.isEmpty)
                          return LoadingView(
                            isNoData: data != null,
                            onReload: () {
                              Provider.of<NotifyProvider>(context,
                                      listen: false)
                                  .getNotify();
                            },
                          );
                        return Expanded(
                          child: ListView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: EdgeInsets.all(0),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    push(value.isPromote
                                        ? SailingDetailScreen(
                                            notifyId: data[index]['id'],
                                          )
                                        : OrderDetailScreen(
                                            bookingId: "3",
                                            title: "notify",
                                            state: 1,
                                            isShowNegativeButton: true,
                                            isShowPositiveButton: true,
                                          ));
                                  },
                                  child: NotifyItem(
                                    data: data[index],
                                    deleteNotify: () {
                                      Provider.of<NotifyProvider>(context,
                                              listen: false)
                                          .deleteNotify(index);
                                    },
                                  ),
                                );
                              }),
                        );
                      },
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
      ChangeNotifierProvider.value(value: _notifySearchProvider),
    ];
  }
}
