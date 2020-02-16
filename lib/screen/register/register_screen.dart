import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/ChangePassProvider.dart';
import 'package:baby_garden_flutter/provider/WaitingOTPProvider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
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
  final TextEditingController _invitePhoneControler = new TextEditingController();
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
            borderRadius: SizeUtil.smallRadius,
            contentPadding: SizeUtil.smallPadding,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          MyTextField(
            textEditingController: _phoneControler,
            hint: S.of(context).enter_phone_number,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.smallRadius,
            contentPadding: SizeUtil.smallPadding,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Consumer<ChangePassProvider>(
            builder:
                (BuildContext context, ChangePassProvider value, Widget child) {
              return MyTextField(
                textEditingController: _passControler,
                hint: S.of(context).password,
                borderColor: ColorUtil.colorAccent,
                borderRadius: SizeUtil.smallRadius,
                contentPadding: SizeUtil.smallPadding,
                obscureText: !value.isShowPass,
                suffix: new GestureDetector(
                  onTap: () {
                    _changePassProvider.onControlShowPass();
                  },
                  child: Icon(
                    value.isShowPass ? Icons.visibility : Icons.visibility_off,
                    size: SizeUtil.iconSizeBigger,
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Consumer<ChangePassProvider>(
            builder:
                (BuildContext context, ChangePassProvider value, Widget child) {
              return MyTextField(
                textEditingController: _repassControler,
                hint: S.of(context).reenter_password,
                borderColor: ColorUtil.colorAccent,
                borderRadius: SizeUtil.smallRadius,
                contentPadding: SizeUtil.smallPadding,
                obscureText: !value.isShowRePass,
                suffix: new GestureDetector(
                  onTap: () {
                    _changePassProvider.onControlShowRePass();
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
            height: SizeUtil.smallSpace,
          ),
          MyTextField(
            textEditingController: _invitePhoneControler,
            hint: S.of(context).enter_invite_phone_number,
            borderColor: ColorUtil.colorAccent,
            borderRadius: SizeUtil.smallRadius,
            contentPadding: SizeUtil.smallPadding,
            suffix: new GestureDetector(
              onTap: () {},
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
              return Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  MyTextField(
                    hint: S.of(context).enter_otp,
                    borderColor: ColorUtil.colorAccent,
                    borderRadius: SizeUtil.smallRadius,
                    contentPadding: SizeUtil.normalPadding,
                    textEditingController: _otpControler,
                    inputType: TextInputType.number,
                  ),
                  Positioned(
                    child: Text(
                        S.of(context).count_down_time(
                            value.start.toString().padLeft(2, "0")),
                        style: TextStyle(
                            color: value.start == 0
                                ? ColorUtil.red
                                : ColorUtil.textColor)),
                    right: SizeUtil.smallSpace,
                  )
                ],
              );
            },
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          RaisedButton(
            onPressed: () {
              _waittingOTPProvider.startTimer();
            },
            color: ColorUtil.colorAccent,
            child: Text(
              S.of(context).register,
              style: TextStyle(
                  fontSize: SizeUtil.textSizeBigger, color: Colors.white),
            ),
          ),
          SizedBox(
            height: SizeUtil.defaultSpace,
          ),
          Consumer<WaittingOTPProvider>(
            builder: (BuildContext context, WaittingOTPProvider value,
                Widget child) {
              return Text(
                value.start == 0
                    ? S.of(context).otp_timer_out
                    : S.of(context).resend_otp,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorUtil.blueForgotPass),
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
