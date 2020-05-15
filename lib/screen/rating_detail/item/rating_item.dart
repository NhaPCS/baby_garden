import 'dart:io';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final ValueNotifier<File> uploadImageController;

  const RatingItem({@required this.uploadImageController}) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        WidgetUtil.getLine(
          width: SizeUtil.tinySpace,
          margin: EdgeInsets.only(
              top: SizeUtil.smallSpace, bottom: SizeUtil.tinySpace),
          color: ColorUtil.lineColor,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: SizeUtil.smallSpace,
              right: SizeUtil.smallSpace,
              top: SizeUtil.tinySpace),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("photo/order_img.png",
                  width: MediaQuery.of(context).size.width / 6),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeUtil.smallSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        S.of(context).order_title,
                        style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: SizeUtil.tinySpace,
                      ),
                      Text(
                        S.of(context).supply_by_supplier("Vườn của bé"),
                        style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: SizeUtil.tinySpace, bottom: SizeUtil.smallSpace),
          child: RatingBar(
            enable: true,
            value: 0,
            isIcon: true,
            showRateCount: false,
            iconColor: ColorUtil.primaryColor,
            starSize: SizeUtil.iconSizeBig,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
          child: MyTextField(
            borderRadius: SizeUtil.smallRadius,
            hint: S.of(context).rating_hint,
            hintStyle: TextStyle(fontSize: SizeUtil.textSizeSmall),
            borderColor: ColorUtil.textColor,
          ),
        ),
        ValueListenableBuilder<File>(
          valueListenable: uploadImageController,
          builder: (BuildContext context, File value, Widget child) {
            print(value);
            return value.path == ""
                ? Container(
                    padding: const EdgeInsets.only(
                        left: SizeUtil.smallSpace,
                        right: SizeUtil.smallSpace,
                        top: SizeUtil.tinySpace),
                    width: MediaQuery.of(context).size.width,
                    child: MyRaisedButton(
                      color: ColorUtil.blueForgotPass,
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      text: S.of(context).add_image,
                      textStyle: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                : CircleImage(
                    borderRadius: SizeUtil.zeroSpace,
                    imageFile: value,
                    imageUrl: null,
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.width / 5);
          },
        ),
      ],
    );
  }
}
