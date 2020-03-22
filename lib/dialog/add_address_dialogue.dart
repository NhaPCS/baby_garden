import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddingAddressDialogue extends StatelessWidget{
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: SizeUtil.midSmallSpace,
                        bottom: SizeUtil.midSmallSpace),
                    child: Text(
                      S.of(context).add_delivery_address,
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
                  MyTextField(
                    hint: S.of(context).enter_receiver_name,
                    title: S.of(context).add_receiver,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: false,
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).enter_receive_phone,
                    title: S.of(context).phone,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    inputType: TextInputType.phone,
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: false,
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).enter_address,
                    title: S.of(context).delivery_address,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: false,
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).choose_province,
                    title: S.of(context).province,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: true,
                    onTrailingTap: () {},
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).choose_district,
                    title: S.of(context).district,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: true,
                    onTrailingTap: () {},
                    isBorder: false,
                  ),
                  MyTextField(
                    hint: S.of(context).choose_sub_district,
                    title: S.of(context).sub_district,
                    titleStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                    hintStyle: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: SizeUtil.smallSpace,
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace),
                    showTrailing: true,
                    onTrailingTap: () {},
                    isBorder: false,
                  ),
                  SizedBox(
                    height: SizeUtil.smallSpace,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: CircleCheckbox(
                        padding: const EdgeInsets.only(
                            left: SizeUtil.tinySpace,
                            right: 0,
                            top: 0,
                            bottom: 0),
                        checkBg: Icons.check_box,
                        text: Text(
                          S.of(context).set_delivery_address,
                          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                        ),
                        uncheckBg: Icons.check_box_outline_blank,
                        color: ColorUtil.gray),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                          S.of(context).cancel,
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
                          S.of(context).add_new,
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
              ),
            );
          },
        ));
  }

}