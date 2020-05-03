import 'dart:io';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:flutter/material.dart';

class CheckChildInfoDialog extends StatelessWidget {
  final VoidCallback onDonePress;
  final String weight;
  final String height;
  final String note;
  final File image;

  const CheckChildInfoDialog(
      {Key key,
      this.onDonePress,
      this.weight,
      this.height,
      this.note,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Text(
        S.of(context).confirm_info,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: ColorUtil.blueLight,
            fontWeight: FontWeight.bold,
            fontSize: SizeUtil.textSizeDefault),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(S.of(context).confirm_child_info_message),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: S.of(context).height_is,
                style: TextStyle(
                    color: ColorUtil.textGray,
                    fontSize: SizeUtil.textSizeDefault)),
            TextSpan(
                text: " ${height}cm",
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: SizeUtil.textSizeDefault))
          ])),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: S.of(context).weight_is,
                style: TextStyle(
                    color: ColorUtil.textGray,
                    fontSize: SizeUtil.textSizeDefault)),
            TextSpan(
                text: " ${weight}cm",
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: SizeUtil.textSizeDefault))
          ])),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: S.of(context).note_is,
                style: TextStyle(
                    color: ColorUtil.textGray,
                    fontSize: SizeUtil.textSizeDefault)),
            TextSpan(
                text: note,
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: SizeUtil.textSizeDefault))
          ])),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Text(S.of(context).image_is,
              style: TextStyle(
                  color: ColorUtil.textGray,
                  fontSize: SizeUtil.textSizeDefault)),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Center(
            child: image == null
                ? SizedBox()
                : CircleImage(
                    width: 300,
                    imageFile: image,
                    borderRadius: 10,
                    height: 150,
                  ),
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyRaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: S.of(context).enter_again,
                borderRadius: 30,
                color: ColorUtil.primaryColor,
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: SizeUtil.defaultSpace,
              ),
              MyRaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onDonePress != null) onDonePress();
                },
                text: S.of(context).agree,
                color: ColorUtil.primaryColor,
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                borderRadius: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
