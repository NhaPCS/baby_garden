import 'dart:io';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final ValueNotifier<File> uploadImageController;
  final TextEditingController controller;
  final String title ;
  final String shopName;
  final String imgLink;
  final ValueNotifier<int> rate;

  const RatingItem({@required this.uploadImageController, this.title = "", this.shopName="", this.imgLink="", this.controller, this.rate}) : super();

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
              CachedNetworkImage(
                imageUrl: imgLink==""?StringUtil.dummyImage:imgLink,
                  width: MediaQuery.of(context).size.width / 6,
                height:MediaQuery.of(context).size.width / 6,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeUtil.smallSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: SizeUtil.tinySpace,
                      ),
                      Text(
                        S.of(context).supply_by_supplier(shopName),
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
            value: rate.value,
            isIcon: true,
            showRateCount: false,
            iconColor: ColorUtil.primaryColor,
            starSize: SizeUtil.iconSizeBig,
            onChange: (star){
              rate.value = star;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
          child: MyTextField(
            textEditingController: controller,
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
                      onPressed: (){
                        ImageUtil.uploadImage(context, (value) {
                          uploadImageController.value = value;
                        });
                      },
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
