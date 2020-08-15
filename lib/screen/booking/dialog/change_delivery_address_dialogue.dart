import 'package:baby_garden_flutter/screen/booking/dialog/add_address_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/receive_address_list_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeDeliveryAddressDialogue extends StatelessWidget {
  const ChangeDeliveryAddressDialogue({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                border: Border.all(
                  color: ColorUtil.primaryColor,
                  width: 0.7,
                ),
              ),
              child: Consumer<ReceiveAddressListProvider>(
                builder: (BuildContext context,
                    ReceiveAddressListProvider value, Widget child) {
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
                      Column(
                        children: List.generate(
                            value.addressList.length,
                            (index) => CustomRadioButton(
                                  titleContent: MyText(
                                    StringUtil.getFullAddress(value.addressList[index]),
                                    style: TextStyle(
                                        fontSize: SizeUtil.textSizeSmall,
                                        color: Colors.black),
                                  ),
                                  padding: const EdgeInsets.only(
                                      bottom: SizeUtil.tinySpace,
                                      top: SizeUtil.tinySpace,
                                      left: SizeUtil.smallSpace,
                                      right: SizeUtil.smallSpace),
                                  value: index,
                                  //const value
                                  groupValue:
                                      Provider.of<ReceiveAddressListProvider>(
                                              context,
                                              listen: false)
                                          .selectedIndex,
                                  // dynamic value
                                  iconSize: SizeUtil.iconSize,
                                  titleSize: SizeUtil.textSizeSmall,
                                  onChanged: (val) {
                                    Provider.of<ReceiveAddressListProvider>(
                                            context,
                                            listen: false)
                                        .onChangeVal(val);
                                  },
                                )),
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
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AddingAddressDialogue());
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
                },
              ),
            );
          },
        ));
  }
}
