import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/list_product/list_product_screen.dart';
import 'package:baby_garden_flutter/screen/remind_management/reminder_layout.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../base_state.dart';

class RemindAddScreen extends StatefulWidget {
  @override
  _RemindAddScreen createState() => _RemindAddScreen();
}

class _RemindAddScreen extends BaseState<RemindAddScreen> {
  final GetListProvider _getListProvider = GetListProvider();
  var remindBuy = false;
  var remindUsed = false;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          title: S.of(context).remindManage,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  decoration: setBorder('bottom', ColorUtil.darkGray, 1),
                  height: SizeUtil.hugSpace,
                  child: Padding(
                    padding: const EdgeInsets.all(SizeUtil.smallSpace),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.add,
                            color: ColorUtil.primaryColor,
                            size: SizeUtil.iconSizeBig),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: SizeUtil.smallSpace),
                          child: Text(S.of(context).selectRemindProduct,
                              style: TextStyle(
                                  color: ColorUtil.darkGray,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  )),
              Expanded(
                child: ReminderLayout(),
              ),
              Container(
                padding: SizeUtil.normalPadding,
                child: ButtonTheme(
                  buttonColor: ColorUtil.primaryColor,
                  padding: SizeUtil.normalPadding,
                  minWidth: double.infinity,
                  height: SizeUtil.biggerSpace,
                  child: RaisedButton(
                    padding: SizeUtil.normalPadding,
                    onPressed: () {},
                    child: Text(
                      S.of(context).addReminder,
                      style:
                      TextStyle(fontSize: SizeUtil.textSizeBigger),
                    ),
                    textColor: Colors.white,
                  ),
                ),
              )
            ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
