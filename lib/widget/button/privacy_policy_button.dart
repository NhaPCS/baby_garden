import 'package:baby_garden_flutter/dialog/privacy_policy_dialogue.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            //todo change icon
          },
          child: SvgIcon(
            'select_icon.svg',
            width: SizeUtil.iconSizeDefault,
            height: SizeUtil.iconSizeDefault,
          ),
        ),
        SizedBox(
          width: SizeUtil.smallSpace,
        ),
        RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: "Đồng ý với ",
                style: TextStyle(
                    color: ColorUtil.textColor,
                    fontSize: SizeUtil.textSizeSmall)),
            TextSpan(
                recognizer: new TapGestureRecognizer()
                  ..onTap = () => showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          PrivacyAndPolicyDialogue()),
                text: "Chính sách & Điều khoản dịch vụ ",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: SizeUtil.textSizeSmall)),
            TextSpan(
                text: "của Shop",
                style: TextStyle(
                    color: ColorUtil.textColor,
                    fontSize: SizeUtil.textSizeSmall)),
          ]),
        ),
      ],
    );
  }

}