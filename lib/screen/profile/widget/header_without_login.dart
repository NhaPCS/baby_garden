import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/login/login_screen.dart';
import 'package:baby_garden_flutter/screen/register/register_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWithoutLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
            left: SizeUtil.smallSpace,
            right: SizeUtil.smallSpace,
            top: SizeUtil.normalSpace,
            bottom: SizeUtil.normalSpace),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Color.fromRGBO(206, 206, 206, 1)),
        )),
        // user information
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: SizeUtil.smallSpace,
          children: <Widget>[
            Image.asset(
              'photo/logo.png',
              width: 70,
              height: 70,
            ),
            Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: SizeUtil.midSmallSpace),
                  child: Text(
                    S.of(context).profileWelcomeText,
                    style: TextStyle(color: ColorUtil.darkGray),
                  ),
                ),
                Wrap(
                  spacing: SizeUtil.midSmallSpace,
                  children: <Widget>[
                    MyRaisedButton(
                      borderRadius: SizeUtil.tinyRadius,
                      color: Color(0xff00B9FF),
                      text: S.of(context).login,
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: SizeUtil.textSizeSmall),
                      onPressed: () {
                        RouteUtil.push(context, LoginScreen());
                      },
                    ),
                    MyRaisedButton(
                      borderRadius: SizeUtil.tinyRadius,
                      color: ColorUtil.primaryColor,
                      text: S.of(context).register,
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: SizeUtil.textSizeSmall),
                      onPressed: () {
                        RouteUtil.push(context, RegisterScreen());
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
