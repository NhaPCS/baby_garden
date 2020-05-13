import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class OTPAlert extends StatefulWidget{
  final bool isTimerStart;
  final int second;


  const OTPAlert({this.isTimerStart, this.second}):super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OTPAlert();
  }

}

class _OTPAlert extends BaseState<OTPAlert>{
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return widget.isTimerStart
        ? (widget.second == 0
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
    );;
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }

}