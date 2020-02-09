import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/enter_phone_number_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/cupertino.dart';
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
        child: Column(
          children: <Widget>[
            Image.asset("photo/logo.png",
                width: MediaQuery.of(context).size.width / 3),
            Text(S.of(context).app_name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontFamily: "hobo")),
            SizedBox(
              height: SizeUtil.bigSpace,
            ),
            Consumer<EnterPhoneNumberProvider>(
              builder: (BuildContext context, EnterPhoneNumberProvider value,
                  Widget child) {
                if (value.isEnterPhoneNumber) {
                  return Container(
                      margin: const EdgeInsets.only(
                          left: SizeUtil.defaultSpace,
                          right: SizeUtil.defaultSpace,
                          top: SizeUtil.smallSpace,
                          bottom: SizeUtil.defaultSpace),
                      child: Column(
                        children: <Widget>[
                          MyTextField(
                            textEditingController: _newPasswordControler,
                            hint: S.of(context).enter_new_password,
                            borderColor: ColorUtil.colorAccent,
                            borderRadius: SizeUtil.smallRadius,
                          ),
                          SizedBox(
                            height: SizeUtil.defaultSpace,
                          ),
                          MyTextField(
                            textEditingController: _reenterNewPasswordControler,
                            hint: S.of(context).reenter_new_password,
                            borderColor: ColorUtil.colorAccent,
                            borderRadius: SizeUtil.smallRadius,
                          ),
                          SizedBox(
                            height: SizeUtil.defaultSpace,
                          ),
                          MyTextField(
                            textEditingController: _otpControler,
                            hint: S.of(context).enter_otp,
                            borderColor: ColorUtil.colorAccent,
                            borderRadius: SizeUtil.smallRadius,
                          )
                        ],
                      ));
                } else {
                  return Container(
                      margin: const EdgeInsets.only(
                          left: SizeUtil.defaultSpace,
                          right: SizeUtil.defaultSpace,
                          bottom: SizeUtil.smallSpace),
                      child: MyTextField(
                        textEditingController: _phoneControler,
                        hint: S.of(context).enter_phone_number,
                        borderColor: ColorUtil.colorAccent,
                        borderRadius: SizeUtil.smallRadius,
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
                    _enterPhoneNumberProvider.isEnterPhoneNumber
                        ? _enterPhoneNumberProvider.changeNewPass(
                            _newPasswordControler.text,
                            _reenterNewPasswordControler.text,
                            _otpControler.text)
                        : _enterPhoneNumberProvider
                            .enterPhoneNumber(_phoneControler.text);
                  },
                  color: ColorUtil.colorAccent,
                  child: Text(
                    S.of(context).confirm,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
            Text(
              S.of(context).return_login,
              style: TextStyle(color: ColorUtil.blueForgotPass),
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _enterPhoneNumberProvider)];
  }
}
