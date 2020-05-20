import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditTransferCheckoutDialogue extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            border: Border.all(color: ColorUtil.primaryColor,
              width: 0.7,),
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
                  S.of(context).credit_transfer,
                  style: TextStyle(
                      color: ColorUtil.primaryColor,
                      fontSize: SizeUtil.textSizeExpressTitle,
                      fontWeight: FontWeight.bold),
                ),
              ),
              WidgetUtil.getLine(
                  margin: EdgeInsets.only(bottom: SizeUtil.tinySpace),
                  color: ColorUtil.lineColor),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).delivery_in_place,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.bold,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).delivery_policy,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.normal,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).get_in_shop,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.bold,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).checkout_policy,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.normal,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).checkout_policy_overal,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.normal,fontSize: SizeUtil.textSizeSmall),),
                  ),
                ],),
              Center(
                child: RaisedButton(
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
              )
            ],
          ),
        ));
  }

}