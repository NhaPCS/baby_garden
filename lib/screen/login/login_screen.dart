import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nested/nested.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreenState();
  }
}

class _LoginScreenState extends BaseState<LoginScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).login,
          centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset("photo/logo.png",
                width: MediaQuery.of(context).size.width / 3),
            Text(S.of(context).app_name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontFamily: "hobo")),
            Expanded(
              child: SizedBox(),
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: SizeUtil.defaultSpace,
                    right: SizeUtil.defaultSpace,
                    bottom: SizeUtil.smallSpace),
                child: MyTextField(
                  hint: S.of(context).enter_phone_number,
                  borderColor: ColorUtil.colorAccent,
                  borderRadius: SizeUtil.smallRadius,
                )),
            Container(
                margin: const EdgeInsets.only(
                    left: SizeUtil.defaultSpace,
                    right: SizeUtil.defaultSpace,
                    top: SizeUtil.smallSpace,
                    bottom: SizeUtil.defaultSpace),
                child: MyTextField(
                  hint: S.of(context).enter_password,
                  borderColor: ColorUtil.colorAccent,
                  borderRadius: SizeUtil.smallRadius,
                )),
            Row(children: <Widget>[
              CircleCheckbox(
                  checkBg: Icons.check_box,
                  uncheckBg: Icons.check_box_outline_blank,
                  color: ColorUtil.gray),
              Text(
                S.of(context).remember_password,
                style: TextStyle(fontSize: SizeUtil.textSizeDefault),
              )
            ]),
            Container(
                padding: const EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                ),
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {},
                  color: ColorUtil.colorAccent,
                  child: Text(
                    S.of(context).login,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
            Text(
              S.of(context).foget_pasword,
              style: TextStyle(color: ColorUtil.blueForgotPass),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: SizeUtil.defaultSpace),
              child: Text(S.of(context).dont_have_account),
            )
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return null;
  }
}
