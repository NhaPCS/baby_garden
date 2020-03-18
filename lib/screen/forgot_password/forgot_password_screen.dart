import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_pass_provider.dart';
import 'package:baby_garden_flutter/provider/waiting_otp_provider.dart';
import 'package:baby_garden_flutter/provider/enter_phone_number_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/forgot_pass_view_model.dart';
import 'package:baby_garden_flutter/widget/my_password_textfield.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ForgotPasswordScreenState();
  }
}

class _ForgotPasswordScreenState extends BaseStateModel<ForgotPasswordScreen,ForgotPasswordViewModel> {
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
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
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
                          MyPasswordTextField(controller: _newPasswordControler,
                              hint: S
                                  .of(context)
                                  .enter_new_password),
                          SizedBox(
                            height: SizeUtil.defaultSpace,
                          ),
                          MyPasswordTextField(controller: _reenterNewPasswordControler,
                              hint: S
                                  .of(context)
                                  .reenter_new_password),
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
                                    elevation: SizeUtil.smallElevation,
                                    borderRadius: SizeUtil.tinyRadius,
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
                                            color: value.start < 10
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
                        elevation: SizeUtil.smallElevation,
                        borderColor: ColorUtil.colorAccent,
                        borderRadius: SizeUtil.tinyRadius,
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
                  onPressed: () async {
                    if (_phoneControler.text.trim().length > 0) {
                      if(_enterPhoneNumberProvider.isEnterPhoneNumber){
                        if(_newPasswordControler.text.trim().length==0||_reenterNewPasswordControler.text.trim().length==0){
                          WidgetUtil.showMessageDialog(context, message: S.of(context).enter_password, title: S.of(context).foget_pasword);
                        }else if (_newPasswordControler.text.trim()!=_reenterNewPasswordControler.text.trim()){
                          WidgetUtil.showMessageDialog(context, message: S.of(context).pass_repass_must_same, title: S.of(context).foget_pasword);
                        }else{
                          var data = await getViewModel().onChangePassword(_phoneControler.text, _newPasswordControler.text);
//                          if (data!=null) {
//                            print(data);
                          WidgetUtil.showMessageDialog(context, message: S.of(context).change_pass_success, title: S.of(context).success,onOkClick: (){
                            Navigator.of(context).pop();
                          });
//                          }
//                            _enterPhoneNumberProvider.changeNewPass(_newPasswordControler.text, _reenterNewPasswordControler.text, _otpControler.text);
                        }
                      }else{
                        var data = await getViewModel().onForgotPassword(_phoneControler.text);
                        if(data!=null){
                          _waittingOTPProvider.startTimer();
                          _enterPhoneNumberProvider.enterPhoneNumber(_phoneControler.text);
                        }
                      }

                    } else {
                      //TODO alert enter phone number
                      WidgetUtil.showMessageDialog(context, message: S.of(context).enter_phone_number, title: S.of(context).foget_pasword);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeUtil.tinyRadius),
                      )),
                  color: ColorUtil.colorAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(SizeUtil.midSpace),
                    child: Text(
                      S.of(context).confirm,
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
            Padding(
              padding: const EdgeInsets.all(SizeUtil.smallSpace),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  S.of(context).return_login,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorUtil.blueForgotPass),
                ),
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

  @override
  ForgotPasswordViewModel initViewModel() {
    // TODO: implement initViewModel
    return new ForgotPasswordViewModel();
  }
}
