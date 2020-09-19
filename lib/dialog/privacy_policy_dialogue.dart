import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/privacy_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class PrivacyAndPolicyDialogue extends StatelessWidget {
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
              border: Border.all(
                color: ColorUtil.primaryColor,
                width: 0.7,
              )),
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
              Padding(
                padding: const EdgeInsets.only(
                    left: SizeUtil.smallSpace,
                    top: SizeUtil.tinySpace,
                    right: SizeUtil.tinySpace,
                    bottom: SizeUtil.tinySpace),
                child: Html(
                  data: Provider.of<PrivacyProvider>(context).privacy ?? '',
                  defaultTextStyle: TextStyle(
                      color: ColorUtil.textColor,
                      fontSize: SizeUtil.textSizeSmall),
                ),
              ),
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
