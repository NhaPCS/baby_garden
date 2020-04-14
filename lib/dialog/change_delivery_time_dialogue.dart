import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_delivery_time_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeDeliveryTimeDialogue extends StatelessWidget {
  final TabController dayTabControler;
  final ChangeDeliveryTimeProvider changeDeliveryTimeProvider;

  const ChangeDeliveryTimeDialogue(
      {Key key, this.dayTabControler, this.changeDeliveryTimeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(
        child: Text(
          "Thứ hai\n01/02/2020",
          style: TextStyle(
            fontSize: SizeUtil.textSizeSmall,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Tab(
        child: Text(
          "Thứ ba\n02/02/2020",
          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
          textAlign: TextAlign.center,
        ),
      ),
      Tab(
        child: Text(
          "Thứ tư\n03/02/2020",
          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
          textAlign: TextAlign.center,
        ),
      ),
    ];
    // TODO: implement build
    return ChangeNotifierProvider.value(
      value: changeDeliveryTimeProvider,
      child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(
                      color: ColorUtil.primaryColor,
                      width: 0.7,
                    ),
                    right: BorderSide(
                      color: ColorUtil.primaryColor,
                      width: 0.7,
                    ),
                    top: BorderSide(
                      color: ColorUtil.primaryColor,
                      width: 0.7,
                    ),
                    bottom: BorderSide(
                      color: ColorUtil.primaryColor,
                      width: 0.7,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TabBar(
                      controller: dayTabControler,
                      labelColor: ColorUtil.primaryColor,
                      indicatorColor: ColorUtil.white,
                      unselectedLabelColor: ColorUtil.textColor,
                      tabs: myTabs,
                      onTap: (val) {
                        changeDeliveryTimeProvider.onChangeDate(val);
                      },
                    ),
                    WidgetUtil.getLine(
                        margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                        color: ColorUtil.lineColor),
                    Consumer<ChangeDeliveryTimeProvider>(
                      builder: (BuildContext context,
                          ChangeDeliveryTimeProvider value, Widget child) {
                        return changeDeliveryTimeProvider.receiveDate != 1
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CustomRadioButton(
                                    titleContent: Text(
                                      "09:00 - 11:00",
                                      style: TextStyle(
                                          fontSize: SizeUtil.textSizeSmall,
                                          color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.only(
                                        bottom: SizeUtil.tinySpace,
                                        top: SizeUtil.tinySpace,
                                        left: SizeUtil.smallSpace,
                                        right: SizeUtil.smallSpace),
                                    value: 0,
                                    groupValue:
                                        changeDeliveryTimeProvider.receiveTime,
                                    iconSize: SizeUtil.iconSize,
                                    titleSize: SizeUtil.textSizeSmall,
                                    onChanged: (val) {
                                      changeDeliveryTimeProvider
                                          .onChangeTime(val);
                                    },
                                  ),
                                  CustomRadioButton(
                                    titleContent: Text(
                                      "14:00 - 16:00",
                                      style: TextStyle(
                                          fontSize: SizeUtil.textSizeSmall,
                                          color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.only(
                                        bottom: SizeUtil.tinySpace,
                                        top: SizeUtil.tinySpace,
                                        left: SizeUtil.smallSpace,
                                        right: SizeUtil.smallSpace),
                                    value: 1,
                                    groupValue:
                                        changeDeliveryTimeProvider.receiveTime,
                                    iconSize: SizeUtil.iconSize,
                                    titleSize: SizeUtil.textSizeSmall,
                                    onChanged: (val) {
                                      changeDeliveryTimeProvider
                                          .onChangeTime(val);
                                    },
                                  ),
                                  CustomRadioButton(
                                    titleContent: Text(
                                      "19:00 - 21:00",
                                      style: TextStyle(
                                          fontSize: SizeUtil.textSizeSmall,
                                          color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.only(
                                        bottom: SizeUtil.tinySpace,
                                        top: SizeUtil.tinySpace,
                                        left: SizeUtil.smallSpace,
                                        right: SizeUtil.smallSpace),
                                    value: 2,
                                    groupValue:
                                        changeDeliveryTimeProvider.receiveTime,
                                    iconSize: SizeUtil.iconSize,
                                    titleSize: SizeUtil.textSizeSmall,
                                    onChanged: (val) {
                                      changeDeliveryTimeProvider
                                          .onChangeTime(val);
                                    },
                                  ),
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: SizeUtil.defaultSpace,
                                  ),
                                  SvgIcon("ic_startup.svg"),
                                  SizedBox(
                                    height: SizeUtil.smallSpace,
                                  ),
                                  Text(
                                    "Không có thời gian nhận hàng",
                                    style: TextStyle(
                                        color: ColorUtil.primaryColor,
                                        fontSize: SizeUtil.textSizeSmall),
                                  ),
                                  Text(
                                    "Vui lòng chọn ngày khác",
                                    style: TextStyle(
                                        color: ColorUtil.textColor,
                                        fontSize: SizeUtil.textSizeSmall),
                                  ),
                                  SizedBox(
                                    height: SizeUtil.bigSpacehigher,
                                  ),
                                ],
                              );
                      },
                    ),
                    SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
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
              );
            },
          )),
    );
  }
}
