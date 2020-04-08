import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:flutter/material.dart';

class ChartClickedInfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Text(
        // TODO-Nha: move to arb file
        "Kết quả kiểm tra",
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
          Row(
            children: <Widget>[
              CircleImage(
                width: 100,
                height: 100,
                borderRadius: 10,
                imageUrl: StringUtil.dummyImage,
              ),
              SizedBox(
                width: SizeUtil.smallSpace,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      // TODO-Nha: move to arb file
                        text: "Bé:",
                        style: TextStyle(
                            color: ColorUtil.textGray,
                            fontSize: SizeUtil.textSizeDefault)),
                    TextSpan(
                        text: " 85cm",
                        style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontSize: SizeUtil.textSizeDefault))
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      // TODO-Nha: move to arb file
                        text: "Ngày sinh:",
                        style: TextStyle(
                            color: ColorUtil.textGray,
                            fontSize: SizeUtil.textSizeDefault)),
                    TextSpan(
                        text: " 85cm",
                        style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontSize: SizeUtil.textSizeDefault))
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      // TODO-Nha: move to arb file
                        text: "Ngày kiểm tra:",
                        style: TextStyle(
                            color: ColorUtil.textGray,
                            fontSize: SizeUtil.textSizeDefault)),
                    TextSpan(
                        text: " 85cm",
                        style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontSize: SizeUtil.textSizeDefault))
                  ])),
                ],
              )),
            ],
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              // TODO-Nha: move to arb file
                text: "Cân nặng:",
                style: TextStyle(
                    color: ColorUtil.textGray,
                    fontSize: SizeUtil.textSizeDefault)),
            TextSpan(
                text: " 85cm",
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: SizeUtil.textSizeDefault))
          ])),
          RichText(
              text: TextSpan(children: [
                TextSpan(
                  // TODO-Nha: move to arb file
                    text: "Đánh giá kết quả:",
                    style: TextStyle(
                        color: ColorUtil.textGray,
                        fontSize: SizeUtil.textSizeDefault)),
                TextSpan(
                    text: " 85cm",
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: SizeUtil.textSizeDefault))
              ])),
        ],
      ),
    );
  }
}
