import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_pass_provider.dart';
import 'package:baby_garden_flutter/provider/waiting_otp_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_password_textfield.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends BaseState<RegisterScreen> {
  final WaittingOTPProvider _waittingOTPProvider = new WaittingOTPProvider();
  final ChangePassProvider _changePassProvider = new ChangePassProvider();
  final TextEditingController _nameControler = new TextEditingController();
  final TextEditingController _phoneControler = new TextEditingController();
  final TextEditingController _passControler = new TextEditingController();
  final TextEditingController _repassControler = new TextEditingController();
  final TextEditingController _invitePhoneControler =
      new TextEditingController();
  final TextEditingController _otpControler = new TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).register,
          centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor),
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
          MyPasswordTextField(controller: _passControler,),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyPasswordTextField(controller: _repassControler,),
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
            suffix: new GestureDetector(
              onTap: () {
                //todo open camera to capture the QAcode
              },
              child: SvgIcon(
                'ic_qr.svg',
                width: 10,
                height: 10,
                padding: const EdgeInsets.all(SizeUtil.smallSpace),
              ),
            ),
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
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
          RaisedButton(
            onPressed: () {
              _waittingOTPProvider.startTimer();
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _waittingOTPProvider.stopTimer();
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [
      ChangeNotifierProvider.value(value: _waittingOTPProvider),
      ChangeNotifierProvider.value(value: _changePassProvider)
    ];
  }
}
