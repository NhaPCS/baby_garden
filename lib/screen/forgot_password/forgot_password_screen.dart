import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_pass_provider.dart';
import 'package:baby_garden_flutter/provider/waiting_otp_provider.dart';
import 'package:baby_garden_flutter/provider/enter_phone_number_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/forgot_pass_view_model.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/input/my_password_textfield.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/text/hobo_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordScreenState();
  }
}

class _ForgotPasswordScreenState extends BaseStateModel<ForgotPasswordScreen,ForgotPasswordViewModel> {
  final ChangePassProvider _changePassProvider = new ChangePassProvider();
  final WaittingOTPProvider _waittingOTPProvider = new WaittingOTPProvider();
  final EnterPhoneNumberProvider _enterPhoneNumberProvider = new EnterPhoneNumberProvider();
  final TextEditingController _phoneControler = new TextEditingController();
  final TextEditingController _newPasswordControler = new TextEditingController();
  final TextEditingController _reenterNewPasswordControler = new TextEditingController();
  final TextEditingController _otpControler = new TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          title: S.of(context).foget_pasword,
          centerTitle: true,
          bgColor: Colors.white,
          titleColor: ColorUtil.primaryColor,
          backColor: ColorUtil.primaryColor),
      body: ListView(
        padding: const EdgeInsets.only(
            left: SizeUtil.defaultSpace,
            right: SizeUtil.defaultSpace,
            bottom: SizeUtil.smallSpace),
        children: <Widget>[
          Image.asset(
            "photo/logo.png",
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 4,
          ),
          HoboText(),
          SizedBox(
            height: SizeUtil.bigSpace,
          ),
          Consumer<EnterPhoneNumberProvider>(
            builder: (BuildContext context, EnterPhoneNumberProvider value,
                Widget child) {
              if (value.isEnterPhoneNumber) {
                return Column(
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
                          Navigator.of(context).pop(S.of(context).alert_code_expire_time);
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
                );
              } else {
                return MyTextField(
                  textEditingController: _phoneControler,
                  hint: S.of(context).enter_phone_number,
                  elevation: SizeUtil.smallElevation,
                  borderColor: ColorUtil.colorAccent,
                  borderRadius: SizeUtil.tinyRadius,
                  contentPadding: SizeUtil.normalPadding,
                  inputType: TextInputType.phone,
                );
              }
            },
          ),
          SizedBox(height: SizeUtil.defaultSpace,),
          MyRaisedButton(
            onPressed: () async {
              if(_enterPhoneNumberProvider.isEnterPhoneNumber){
                final data = await getViewModel().onChangePassword(_phoneControler.text, _newPasswordControler.text,_reenterNewPasswordControler.text);
                if(data!=null){
                  WidgetUtil.showMessageDialog(context, message: S.of(context).change_pass_success, title: S.of(context).success,onOkClick: (){
                    Navigator.of(context).pop();
                  });
                }
              }else{
                var data = await getViewModel().onForgotPassword(_phoneControler.text);
                if(data!=null&&data.lengh>0){
                  WidgetUtil.showMessageDialog(context, message: data, title: S.of(context).notify);
                }else {
                  _waittingOTPProvider.startTimer();
                  _enterPhoneNumberProvider.enterPhoneNumber(_phoneControler.text);
                }
              }
            },
            padding: const EdgeInsets.all(SizeUtil.midSpace),
            color: ColorUtil.colorAccent,
            text: S.of(context).confirm,
            textStyle:  TextStyle(fontSize: SizeUtil.textSizeDefault, color: Colors.white, fontStyle: FontStyle.normal),
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
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
    );
  }

  String checkCondition(){

  }

  @override
  void dispose() {
    _waittingOTPProvider.stopTimer();
    super.dispose();
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _enterPhoneNumberProvider),
      ChangeNotifierProvider.value(value: _changePassProvider),
      ChangeNotifierProvider.value(value: _waittingOTPProvider),
    ];
  }

  @override
  ForgotPasswordViewModel initViewModel() {
    return new ForgotPasswordViewModel(context);
  }
}
