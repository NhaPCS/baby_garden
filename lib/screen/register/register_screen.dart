import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/waiting_otp_provider.dart';
import 'package:baby_garden_flutter/screen/register/widget/otp_alert.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/register/view_model/register_view_model.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/input/my_password_textfield.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/text/hobo_text.dart';
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
  final WaitingOTPProvider _waitingOTPProvider = new WaitingOTPProvider();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  final TextEditingController _reTypePassController = new TextEditingController();
  final TextEditingController _invitePhoneController =
      new TextEditingController();
  final TextEditingController _otpController = new TextEditingController();
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
      body: ListView(
        padding: const EdgeInsets.only(
            left: SizeUtil.bigSpace, right: SizeUtil.bigSpace),
        children: <Widget>[
          Image.asset(
            "photo/logo.png",
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 4,
          ),
          HoboText(
            fontSize: 1,
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          MyTextField(
            textEditingController: _nameController,
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
            textEditingController: _phoneController,
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
            controller: _passController,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyPasswordTextField(
            controller: _reTypePassController,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyTextField(
            textEditingController: _invitePhoneController,
            hint: S.of(context).enter_invite_phone_number,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.tinyRadius,
            elevation: SizeUtil.smallElevation,
            contentPadding: SizeUtil.smallPadding,
            inputType: TextInputType.phone,
            suffix: Icon(Icons.card_giftcard),
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Consumer<WaitingOTPProvider>(
            builder: (BuildContext context, WaitingOTPProvider value,
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
                          textEditingController: _otpController,
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
          MyRaisedButton(
            onPressed: register,
            color: ColorUtil.colorAccent,
            text: S.of(context).register,
            textStyle: TextStyle(
                fontSize: SizeUtil.textSizeBigger, color: Colors.white),
            padding: EdgeInsets.all(SizeUtil.smallSpace),
            borderRadius: SizeUtil.tinyRadius,
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          Consumer<WaitingOTPProvider>(
            builder: (BuildContext context, WaitingOTPProvider value,
                Widget child) {
              return OTPAlert(
                isTimerStart: value.isTimerStart,
                second: value.start,
              );
            },
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          )
        ],
      ),
    );
  }

  void register() async {
    if (isShowOTP) {
      //todo check show otp input
      if (_waitingOTPProvider.start > 0) {
        //todo OTP timer out
        await getViewModel().onRegister(
            name: _nameController.text.toString(),
            phone: _phoneController.text.toString(),
            password: _passController.text.toString(),
            rePass: _reTypePassController.text.toString(),
            refCode: _invitePhoneController.text.toString(),
            code: _otpController.text.toString().trim());
      }
    } else {
      //todo send verify code and show otp input
      var code = await getViewModel().onGetVerifyCode(
          name: _nameController.text.toString(),
          phone: _phoneController.text.toString(),
          password: _passController.text.toString(),
          rePass: _reTypePassController.text.toString(),
          refCode: _invitePhoneController.text.toString());
      if (code != null) {
        print(code);
        isShowOTP = true;
        _waitingOTPProvider.startTimer();
      }
    }
  }

  @override
  void dispose() {
    _waitingOTPProvider.stopTimer();
    super.dispose();
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _waitingOTPProvider),
    ];
  }

  @override
  RegisterViewModel initViewModel() {
    return new RegisterViewModel(context);
  }
}
