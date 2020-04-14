import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_pass_provider.dart';
import 'package:baby_garden_flutter/provider/waiting_otp_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/register_view_model.dart';
import 'package:baby_garden_flutter/widget/input/my_password_textfield.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../base_state_model.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState
    extends BaseStateModel<RegisterScreen, RegisterViewModel> {
  // TODO-Hung: tao widget rieng cho OTP
  final WaittingOTPProvider _waittingOTPProvider = new WaittingOTPProvider();
  final ChangePassProvider _changePassProvider = new ChangePassProvider();
  final TextEditingController _nameControler = new TextEditingController();
  final TextEditingController _phoneControler = new TextEditingController();
  final TextEditingController _passControler = new TextEditingController();
  final TextEditingController _repassControler = new TextEditingController();
  final TextEditingController _invitePhoneControler =
      new TextEditingController();
  final TextEditingController _otpControler = new TextEditingController();
  bool isShowOTP = false;

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).register,
          centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor),
      // TODO-Hung: center lam gi? bo di
      body: Center(
          child: ListView(
        padding: const EdgeInsets.only(
            left: SizeUtil.bigSpace, right: SizeUtil.bigSpace),
        children: <Widget>[
          Image.asset(
            "photo/logo.png",
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 4,
          ),
          Text(S.of(context).app_name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeUtil.textSizeLogo, fontFamily: "hobo")),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          MyTextField(
            textEditingController: _nameControler,
            hint: S.of(context).your_full_name,
            borderColor: ColorUtil.colorAccent,
            elevation: SizeUtil.smallElevation,
            borderRadius: SizeUtil.tinyRadius,
            contentPadding: SizeUtil.normalPadding,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyTextField(
            textEditingController: _phoneControler,
            hint: S.of(context).enter_phone_number,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.tinyRadius,
            elevation: SizeUtil.smallElevation,
            contentPadding: SizeUtil.normalPadding,
            inputType: TextInputType.phone,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyPasswordTextField(
            controller: _passControler,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyPasswordTextField(
            controller: _repassControler,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyTextField(
            textEditingController: _invitePhoneControler,
            hint: S.of(context).enter_invite_phone_number,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.tinyRadius,
            elevation: SizeUtil.smallElevation,
            contentPadding: SizeUtil.smallPadding,
            inputType: TextInputType.phone,
            suffix: new GestureDetector(
              onTap: () {
                //todo open camera to capture the QAcode
              },
              child: Icon(Icons.card_giftcard),
            ),
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          // TODO-Hung: chuyen sang tao Widget de nhap OTP
          Consumer<WaittingOTPProvider>(
            builder: (BuildContext context, WaittingOTPProvider value,
                Widget child) {
              return value.isTimerStart
                  ? Stack(
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                        MyTextField(
                          hint: S.of(context).enter_otp,
                          borderColor: ColorUtil.colorAccent,
                          borderRadius: SizeUtil.tinyRadius,
                          elevation: SizeUtil.smallElevation,
                          contentPadding: SizeUtil.normalPadding,
                          textEditingController: _otpControler,
                          inputType: TextInputType.number,
                          autoFocus: true,
                        ),
                        Positioned(
                          child: Text(
                              S.of(context).count_down_time(
                                  value.start.toString().padLeft(2, "0")),
                              style: TextStyle(
                                  color: value.start < 10
                                      ? ColorUtil.red
                                      : ColorUtil.textColor)),
                          right: SizeUtil.smallSpace,
                        )
                      ],
                    )
                  : SizedBox();
            },
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          // TODO-Hung: dung MyRaisedButton
          RaisedButton(
            onPressed: () async {
              // TODO-Hung: cho mat phan verify nay vào 1 hàm chung, k đẻ if else qúa nhiều, dung ham WidgetUtil.verifyParams
              String check = checkRegisterCondition(isShowOTP);
              if (check.trim().length == 0) {
                if (isShowOTP) {//todo check show otp input
                  if (_waittingOTPProvider.start > 0){ //todo OTP timer out
                    if (_otpControler.text.trim().length > 0) {//todo check otp invalid
                      //todo
                      await getViewModel().onRegister(
                          name: _nameControler.text.toString(),
                          phone: _phoneControler.text.toString(),
                          password: _passControler.text.toString(),
                          refCode: _invitePhoneControler.text.toString(),
                          code: _otpControler.text.toString().trim());
                    } else {
                      WidgetUtil.showErrorDialog(context, "Vui lòng nhập OTP");
                    }
                  }
                } else {
                  //todo send verify code and show otp input
                  var code = await getViewModel().onGetVerifyCode(
                      name: _nameControler.text.toString(),
                      phone: _phoneControler.text.toString(),
                      password: _passControler.text.toString(),
                      refCode: _invitePhoneControler.text.toString());
                  if (code != null) {
                    print(code);
                    isShowOTP = true;
                    _waittingOTPProvider.startTimer();
                  }
                }
                // todo get verify code

              } else {
                WidgetUtil.showMessageDialog(context,
                    message: check, title: "Alert");
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(SizeUtil.tinyRadius),
            )),
            color: ColorUtil.colorAccent,
            child: Padding(
              padding: const EdgeInsets.all(SizeUtil.smallSpace),
              child: Text(
                S.of(context).register,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeBigger, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          // TODO-Hung: chuyen sng tao Widget rieng cho nhap OTP
          Consumer<WaittingOTPProvider>(
            builder: (BuildContext context, WaittingOTPProvider value,
                Widget child) {
              return value.isTimerStart
                  ? (value.start == 0
                      ? RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                                  "Nếu bạn không đăng ký được, vui lòng gọi điện tới số  ",
                              style: TextStyle(
                                color: ColorUtil.textColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "0912 277 022",
                                    style: TextStyle(
                                        color: ColorUtil.green,
                                        decoration: TextDecoration.none)),
                                TextSpan(
                                    text: " để được hỗ trợ",
                                    style: TextStyle(
                                        color: ColorUtil.textColor,
                                        decoration: TextDecoration.none)),
                              ]),
                        )
                      : InkWell(
                          onTap: () {
                            //todo resend otp
                          },
                          child: Text(
                            S.of(context).resend_otp,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorUtil.primaryColor),
                          ),
                        ))
                  : InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        S.of(context).return_login_if_had_account,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorUtil.blueForgotPass),
                      ),
                    );
            },
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          )
        ],
      )),
    );
  }

  String checkRegisterCondition(bool isShowOTP) {
    // TODO-Hung: dung WidgetUtil.verifyParam
    if (_nameControler.text.trim().length == 0) {
      return "Please Enter name";
    } else if (_phoneControler.text.trim().length == 0) {
      return "Please Enter Phone number";
    } else if (_passControler.text.trim().length == 0) {
      return "Please Enter password";
    } else if (_repassControler.text.trim().length == 0) {
      return "Please Enter repassword";
    } else if (_passControler.text.compareTo(_repassControler.text) < 0) {
      return "Password and repassword must be the same";
    } else if (_invitePhoneControler.text.trim().length == 0) {
      return "Please Enter invite phone number";
    } else {
      if (isShowOTP) {
        if (_otpControler.text.trim().length == 0) {
          return "Please Enter code";
        } else {
          return "";
        }
      } else {
        return "";
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // TODO-Hung: de truoc dispose
    _waittingOTPProvider.stopTimer();
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _waittingOTPProvider),
      ChangeNotifierProvider.value(value: _changePassProvider)
    ];
  }

  @override
  RegisterViewModel initViewModel() {
    return new RegisterViewModel(context);
  }
}
