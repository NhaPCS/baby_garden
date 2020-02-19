import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/ChangePassProvider.dart';
import 'package:baby_garden_flutter/provider/WaitingOTPProvider.dart';
import 'package:baby_garden_flutter/provider/enter_phone_number_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ForgotPasswordScreenState();
  }
}

class _ForgotPasswordScreenState extends BaseState<ForgotPasswordScreen> {
  final ChangePassProvider _changePassProvider = new ChangePassProvider();
  final WaittingOTPProvider _waittingOTPProvider = new WaittingOTPProvider();
  final EnterPhoneNumberProvider _enterPhoneNumberProvider =
      new EnterPhoneNumberProvider();
  final TextEditingController _phoneControler = new TextEditingController();
  final TextEditingController _newPasswordControler =
      new TextEditingController();
  final TextEditingController _reenterNewPasswordControler =
      new TextEditingController();
  final TextEditingController _otpControler = new TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).foget_pasword,
          centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor),
      body: Center(
        child: ListView(
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
              height: SizeUtil.bigSpace,
            ),
            Consumer<EnterPhoneNumberProvider>(
              builder: (BuildContext context, EnterPhoneNumberProvider value,
                  Widget child) {
                if (value.isEnterPhoneNumber) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: SizeUtil.defaultSpace,
                          right: SizeUtil.defaultSpace,
                          top: SizeUtil.smallSpace,
                          bottom: SizeUtil.defaultSpace),
                      child: Column(
                        children: <Widget>[
                          Consumer<ChangePassProvider>(
                            builder: (BuildContext context,
                                ChangePassProvider value, Widget child) {
                              return MyTextField(
                                textEditingController: _newPasswordControler,
                                hint: S.of(context).enter_new_password,
                                borderColor: ColorUtil.colorAccent,
                                borderRadius: SizeUtil.smallRadius,
                                contentPadding: SizeUtil.normalPadding,
                                obscureText: !value.isShowPass,
                                suffix: new GestureDetector(
                                  onTap: () {
                                    _changePassProvider.onControlShowPass();
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
                          SizedBox(
                            height: SizeUtil.defaultSpace,
                          ),
                          Consumer<ChangePassProvider>(
                            builder: (BuildContext context,
                                ChangePassProvider value, Widget child) {
                              return MyTextField(
                                textEditingController:
                                    _reenterNewPasswordControler,
                                hint: S.of(context).reenter_new_password,
                                borderColor: ColorUtil.colorAccent,
                                borderRadius: SizeUtil.smallRadius,
                                contentPadding: SizeUtil.normalPadding,
                                obscureText: !value.isShowRePass,
                                suffix: new GestureDetector(
                                  onTap: () {
                                    _changePassProvider
                                        .onControlShowRePass();
                                  },
                                  child: Icon(
                                    value.isShowRePass
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: SizeUtil.iconSizeBigger,
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: SizeUtil.defaultSpace,
                          ),
                          Consumer<WaittingOTPProvider>(
                            builder: (BuildContext context,
                                WaittingOTPProvider value, Widget child) {
                              if (value.start == 0) {
                                //todo: alert OTP invalid because timer out
                              }
                              return Stack(
                                alignment: Alignment.centerRight,
                                children: <Widget>[
                                  MyTextField(
                                    textEditingController: _otpControler,
                                    hint: S.of(context).enter_otp,
                                    borderColor: ColorUtil.colorAccent,
                                    borderRadius: SizeUtil.smallRadius,
                                    contentPadding: SizeUtil.normalPadding,
                                    inputType: TextInputType.number,
                                  ),
                                  Positioned(
                                    child: Text(
                                        S.of(context).count_down_time(value
                                            .start
                                            .toString()
                                            .padLeft(2, "0")),
                                        style: TextStyle(
                                            color: value.start == 0
                                                ? ColorUtil.red
                                                : ColorUtil.textColor)),
                                    right: SizeUtil.smallSpace,
                                  )
                                ],
                              );
                            },
                          )
                        ],
                      ));
                } else {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: SizeUtil.defaultSpace,
                          right: SizeUtil.defaultSpace,
                          bottom: SizeUtil.smallSpace),
                      child: MyTextField(
                        textEditingController: _phoneControler,
                        hint: S.of(context).enter_phone_number,
                        borderColor: ColorUtil.colorAccent,
                        borderRadius: SizeUtil.smallRadius,
                        contentPadding: SizeUtil.normalPadding,
                        inputType: TextInputType.phone,
                      ));
                }
              },
            ),
            Container(
                padding: const EdgeInsets.only(
                  left: SizeUtil.defaultSpace,
                  right: SizeUtil.defaultSpace,
                ),
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    if (_phoneControler.text.trim().length > 0) {
                      _waittingOTPProvider.startTimer();
                      _enterPhoneNumberProvider.isEnterPhoneNumber
                          ? _enterPhoneNumberProvider.changeNewPass(
                              _newPasswordControler.text,
                              _reenterNewPasswordControler.text,
                              _otpControler.text)
                          : _enterPhoneNumberProvider
                              .enterPhoneNumber(_phoneControler.text);
                    } else {
                      //TODO alert enter phone number
                    }
                  },
                  color: ColorUtil.colorAccent,
                  child: Text(
                    S.of(context).confirm,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: Colors.white,
                        fontStyle: FontStyle.normal),
                  ),
                )),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).return_login,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorUtil.blueForgotPass),
              ),
            ),
          ],
        ),
      ),
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
      ChangeNotifierProvider.value(value: _enterPhoneNumberProvider),
      ChangeNotifierProvider.value(value: _changePassProvider),
      ChangeNotifierProvider.value(value: _waittingOTPProvider),
    ];
  }
}
