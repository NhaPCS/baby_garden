import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/login/login_screen.dart';
import 'package:baby_garden_flutter/screen/register/register_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWithoutLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // TODO-QAnh: k set height, để wrap
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.only(
            left: SizeUtil.smallSpace,
            right: SizeUtil.smallSpace,
            top: 12,
            bottom: 12),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Color.fromRGBO(206, 206, 206, 1)),
        )),
        // user information
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: SizeUtil.smallSpace),
              child: Image.asset(
                'photo/logo.png',
                width: 70,
                height: 70,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: SizeUtil.midSmallSpace),
                  child: Text(
                    S.of(context).profileWelcomeText,
                    style: TextStyle(color: ColorUtil.darkGray),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(right: SizeUtil.midSmallSpace),
                      child: RaisedButton(
                          color: Color(0xff00B9FF),
                          onPressed: () {
                            RouteUtil.push(context, LoginScreen());
                          },
                          child: Text(S.of(context).login,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeUtil.textSizeSmall))),
                    ),
                    // TODO-QAnh: dung MyRasiedButton
                    RaisedButton(
                        color: ColorUtil.primaryColor,
                        onPressed: () {
                          RouteUtil.push(context, RegisterScreen());
                        },
                        child: Text(S.of(context).register,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeUtil.textSizeSmall)))
                  ],
                )
              ],
            )
          ],
        ));
  }
}
