import 'package:baby_garden_flutter/dialog/add_address_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_delivery_address_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/custom_radio_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeDeliveryAddressDialogue extends StatelessWidget{

  final ChangeDeliveryAddressProvider changeDeliveryAddressProvider;
  const ChangeDeliveryAddressDialogue({Key key,this.changeDeliveryAddressProvider}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider.value(value: changeDeliveryAddressProvider,
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
              child:
              Consumer<ChangeDeliveryAddressProvider>(builder: (BuildContext context, ChangeDeliveryAddressProvider value, Widget child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: SizeUtil.midSmallSpace,
                          bottom: SizeUtil.midSmallSpace),
                      child: Text(
                        S.of(context).change_delivery_address,
                        style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontSize: SizeUtil.textSizeExpressTitle,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    WidgetUtil.getLine(
                        margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                        color: ColorUtil.lineColor),
                    SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
                    CustomRadioButton(
                      titleContent: Text(
                        "Lê Văn Lĩnh - 0975 441 005\n28 Phan Kế Bính\nPhường Cống Vị, Quận Ba Đình, Hà Nội",
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
                      groupValue: changeDeliveryAddressProvider.deliveryAddress,
                      iconSize: SizeUtil.iconSize,
                      titleSize: SizeUtil.textSizeSmall,
                      onChanged: (val) {
                        changeDeliveryAddressProvider.onChangeAddress(val);
//                      setDeliveryAddress(val);
                      },
                    ),
                    CustomRadioButton(
                      titleContent: Text(
                        "Lê Văn Lĩnh - 0975 441 005\n28 Phan Kế Bính\nPhường Cống Vị, Quận Ba Đình, Hà Nội",
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
                      groupValue: changeDeliveryAddressProvider.deliveryAddress,
                      iconSize: SizeUtil.iconSize,
                      titleSize: SizeUtil.textSizeSmall,
                      onChanged: (val) {
                        changeDeliveryAddressProvider.onChangeAddress(val);
//                      setDeliveryAddress(val);
                      },
                    ),
                    CustomRadioButton(
                      titleContent: Text(
                        "Lê Văn Lĩnh - 0975 441 005\n28 Phan Kế Bính\nPhường Cống Vị, Quận Ba Đình, Hà Nội",
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
                      groupValue: changeDeliveryAddressProvider.deliveryAddress,
                      iconSize: SizeUtil.iconSize,
                      titleSize: SizeUtil.textSizeSmall,
                      onChanged: (val) {
                        changeDeliveryAddressProvider.onChangeAddress(val);
//                      setDeliveryAddress(val);
                      },
                    ),
                    SizedBox(
                      height: SizeUtil.smallSpace,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            showDialog(
                                context: context, builder: (BuildContext context) => AddingAddressDialogue());
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(SizeUtil.smallRadius),
                              )),
                          color: ColorUtil.primaryColor,
                          child: Text(
                            S.of(context).add_new,
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: SizeUtil.defaultSpace,
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
                        ),
                      ],
                    )
                  ],
                );
              },),
            );
          },
        )));
  }

}