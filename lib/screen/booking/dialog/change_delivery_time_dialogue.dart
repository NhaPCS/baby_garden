import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking/provider/change_delivery_time_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ChangeDeliveryTimeDialogue extends StatefulWidget {
  final String shopId;
  const ChangeDeliveryTimeDialogue({this.shopId}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChangeDeliveryTimeDialogueState();
  }
}

class _ChangeDeliveryTimeDialogueState
    extends BaseState<ChangeDeliveryTimeDialogue>
    with SingleTickerProviderStateMixin {
  TabController _dayTabController;
  final ChangeDeliveryTimeProvider _changeDeliveryTimeProvider =
      new ChangeDeliveryTimeProvider();

  @override
  void initState() {
    // TODO: implement initState
    _dayTabController = TabController(vsync: this, length: 3);
    if (_changeDeliveryTimeProvider.schedules.length == 0) {
      _changeDeliveryTimeProvider.getInShopReceiveTime(null, widget.shopId);
    }
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    final List<dynamic> dates = DateUtil.getDate(3);
    String chooseTime = "";
    String chooseDate = dates[0]['date'];
    String timeId = "";
    _changeDeliveryTimeProvider.receiveDate = dates[0]['index'];
    // TODO: implement buildWidget
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            border: Border.all(
              color: ColorUtil.primaryColor,
              width: 0.7,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TabBar(
                isScrollable: true,
                controller: _dayTabController,
                labelColor: ColorUtil.primaryColor,
                indicatorColor: ColorUtil.white,
                unselectedLabelColor: ColorUtil.textColor,
                tabs: dates
                    .map((e) => Tab(
                          child: Text(
                            "${e['dow']}\n${e['date']}",
                            style: TextStyle(
                              fontSize: SizeUtil.textSizeSmall,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ))
                    .toList(),
                onTap: (val) {
                  chooseDate = dates[val]['date'];
                  _changeDeliveryTimeProvider.onChangeDate(dates[val]['index']);
                },
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                  color: ColorUtil.lineColor),
              Consumer<ChangeDeliveryTimeProvider>(
                builder: (BuildContext context,
                    ChangeDeliveryTimeProvider value, Widget child) {
                  List<dynamic> schedule = value.getDateSchedule();
                  timeId = schedule.isNotEmpty?schedule[0]['id']:"0";
                  if (schedule == null || schedule.isEmpty) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: SizeUtil.defaultSpace,
                        ),
                        SvgIcon("ic_startup.svg"),
                        SizedBox(
                          height: SizeUtil.smallSpace,
                        ),
                        Text(
                          S.of(context).no_receive_time,
                          style: TextStyle(
                              color: ColorUtil.primaryColor,
                              fontSize: SizeUtil.textSizeSmall),
                        ),
                        SizedBox(
                          height: SizeUtil.bigSpaceHigher,
                        ),
                      ],
                    );
                  }
                  if(chooseTime.isEmpty){
                    chooseTime = "${schedule[0]['time_start']} - ${schedule[0]['time_end']}";
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: schedule.map((e) => CustomRadioButton(
                      titleContent: Text(
                        "${e['time_start']} - ${e['time_end']}",
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            color: Colors.black),
                      ),
                      padding: const EdgeInsets.only(
                          bottom: SizeUtil.tinySpace,
                          top: SizeUtil.tinySpace,
                          left: SizeUtil.smallSpace,
                          right: SizeUtil.smallSpace),
                      value: schedule.indexOf(e),
                      groupValue: _changeDeliveryTimeProvider.receiveTime,
                      iconSize: SizeUtil.iconSize,
                      titleSize: SizeUtil.textSizeSmall,
                      onChanged: (val) {
                        chooseTime = "${e['time_start']} - ${e['time_end']}";
                        timeId = e['id'];
                        _changeDeliveryTimeProvider.onChangeTime(val);
                      },
                    )).toList(),
                  );
                },
              ),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop({"data":chooseTime +" " +  chooseDate,"id":timeId});
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(SizeUtil.smallRadius),
                )),
                color: ColorUtil.primaryColor,
                child: Text(
                  S.of(context).confirm,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _changeDeliveryTimeProvider)];
  }
}
