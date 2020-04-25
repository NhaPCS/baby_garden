import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyAndPolicyDialogue extends StatelessWidget{
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
                  S.of(context).policy_privacy,
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
                    child: Text(S.of(context).overral_policy,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.bold,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).policy_1,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.normal,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).privacy,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.bold,fontSize: SizeUtil.textSizeSmall),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: SizeUtil.smallSpace,top: SizeUtil.tinySpace,right: SizeUtil.tinySpace),
                    child: Text(S.of(context).privacy_1,style: TextStyle(color: ColorUtil.textColor,fontWeight: FontWeight.normal,fontSize: SizeUtil.textSizeSmall),),
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