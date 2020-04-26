import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/forgot_password/forgot_password_screen.dart';
import 'package:baby_garden_flutter/screen/login/view_model/login_view_model.dart';
import 'package:baby_garden_flutter/screen/register/register_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/input/my_password_textfield.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/text/hobo_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends BaseStateModel<LoginScreen, LoginViewModel> {
  final TextEditingController _phoneControler = new TextEditingController();
  final TextEditingController _passControler = new TextEditingController();
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).login,
          centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "photo/logo.png",
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 4,
          ),
          HoboText(fontSize: SizeUtil.textSizeBigger),
          Spacer(),
          Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpace,
                  right: SizeUtil.bigSpace,
                  bottom: SizeUtil.smallSpace),
              child: MyTextField(
                hint: S.of(context).enter_phone_number,
                borderColor: ColorUtil.colorAccent,
                borderRadius: SizeUtil.tinyRadius,
                contentPadding: SizeUtil.normalPadding,
                elevation: SizeUtil.smallElevation,
                inputType: TextInputType.phone,
                textEditingController: _phoneControler,
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.bigSpace,
                right: SizeUtil.bigSpace,
                top: SizeUtil.smallSpace,
                bottom: SizeUtil.defaultSpace),
            child: MyPasswordTextField(controller: _passControler,),//
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: CircleCheckbox(
                padding: const EdgeInsets.only(
                    left: SizeUtil.bigSpace,
                    right: SizeUtil.normalSpace,
                    top: 0,
                    bottom: 0),
                checkBg: Icons.check_box,
                text: Text(
                  S.of(context).remember_password,
                  style: TextStyle(fontSize: SizeUtil.textSizeDefault),
                ),
                uncheckBg: Icons.check_box_outline_blank,
                color: ColorUtil.gray),
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpace,
                  right: SizeUtil.bigSpace,
                  top: SizeUtil.smallSpace),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () async {
                  getViewModel().onLogin(password: _passControler.text, phone: _phoneControler.text);
                },
                color: ColorUtil.colorAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeUtil.tinyRadius),
                    )),
                child: Container(
                  padding: EdgeInsets.all(SizeUtil.midSpace),
                  child: Text(
                    S.of(context).login,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: Colors.white,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              )),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          InkWell(
            onTap: () async{
              final String result = await push(ForgotPasswordScreen());
              if (result!=null &&result.length>0){
                WidgetUtil.showMessageDialog(context, message: S.of(context).alert_code_expire_time, title: S.of(context).notify);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(SizeUtil.tinySpace),
              child: Text(
                S.of(context).foget_pasword,
                style: TextStyle(color: ColorUtil.blueForgotPass),
              ),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              push(RegisterScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(SizeUtil.tinySpace),
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
          ),
          Spacer()
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }

  @override
  LoginViewModel initViewModel() {
    return new LoginViewModel(context);
  }
}
