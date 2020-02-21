import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/show_hide_pass_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/forgot_password/forgot_password_screen.dart';
import 'package:baby_garden_flutter/screen/register/register_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreenState();
  }
}

class _LoginScreenState extends BaseState<LoginScreen> {
  final ShowHidePassProvider _showHidePassProvider = new ShowHidePassProvider();

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
                style: TextStyle(fontSize: SizeUtil.textSizeLogo, fontFamily: "hobo")),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: SizeUtil.defaultSpace,
                    right: SizeUtil.defaultSpace,
                    bottom: SizeUtil.smallSpace),
                child: MyTextField(
                  hint: S.of(context).enter_phone_number,
                  borderColor: ColorUtil.colorAccent,
                  borderRadius: SizeUtil.smallRadius,
                  contentPadding: SizeUtil.normalPadding,
                  inputType: TextInputType.phone,
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.defaultSpace),
              child: Consumer<ShowHidePassProvider>(
                builder: (BuildContext context, ShowHidePassProvider value,
                    Widget child) {
                  return MyTextField(
                    hint: S.of(context).enter_password,
                    borderColor: ColorUtil.colorAccent,
                    borderRadius: SizeUtil.smallRadius,
                    contentPadding: SizeUtil.normalPadding,
                    inputType: TextInputType.text,
                    obscureText: !value.isShowPass,
                    suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showHidePassProvider.onControllClick();
                        });
                      },
                      child: Icon(
                        value.isShowPass
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: SizeUtil.iconSizeBigger,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.tinySpace,
                  right: SizeUtil.tinySpace,
                  top: 0,
                  bottom: 0),
              child: Row(children: <Widget>[
                CircleCheckbox(
                    checkBg: Icons.check_box,
                    uncheckBg: Icons.check_box_outline_blank,
                    color: ColorUtil.gray),
                Text(
                  S.of(context).remember_password,
                  style: TextStyle(fontSize: SizeUtil.textSizeDefault),
                )
              ]),
            ),
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
                    style: TextStyle(fontSize: SizeUtil.textSizeDefault, color: Colors.white,fontStyle: FontStyle.normal),
                  ),
                )),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            InkWell(
              onTap: () {
                push(ForgotPasswordScreen());
              },
              child: Text(
                S.of(context).foget_pasword,
                style: TextStyle(color: ColorUtil.blueForgotPass),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            InkWell(
              onTap: () {
                push(RegisterScreen());
              },
              child: RichText(
                text: TextSpan(
                    text: S.of(context).dont_have_account,
                    style: TextStyle(
                        color: ColorUtil.blueForgotPass,
                        decoration: TextDecoration.underline),
                    children: <TextSpan>[
                      TextSpan(
                          text: S.of(context).register,
                          style: TextStyle(
                              color: ColorUtil.primaryColor,
                              decoration: TextDecoration.none)),
                    ]),
              ),
            ),
            SizedBox(
              height: SizeUtil.smallSpace,
            )
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _showHidePassProvider)];
  }
}
