import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/circle_image.dart';
import 'package:flutter/material.dart';

class CheckChildInfoDialog extends StatelessWidget {
  final VoidCallback onDonePress;

  const CheckChildInfoDialog({Key key, this.onDonePress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Text(
        "Xác nhận thông tin",
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
          Text(
              "Bố/mẹ kiểm tra lại thông tin chiều cao, can năng của bé vừa nhập đã nhập đã đúng chưa nhé:"),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Chiều cao:",
                style: TextStyle(
                    color: ColorUtil.textGray,
                    fontSize: SizeUtil.textSizeDefault)),
            TextSpan(
                text: " 85cm",
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
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Lưu bút:",
                style: TextStyle(
                    color: ColorUtil.textGray,
                    fontSize: SizeUtil.textSizeDefault)),
            TextSpan(
                text:
                    " Đây là tính năng sẽ có tại:\nVườn Của Bé NEW (Coming soon!)",
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: SizeUtil.textSizeDefault))
          ])),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Text("Ảnh của bé:",
              style: TextStyle(
                  color: ColorUtil.textGray,
                  fontSize: SizeUtil.textSizeDefault)),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Center(
            child: CircleImage(
              width: 100,
              height: 100,
              imageUrl: StringUtil.dummyImage,
              borderRadius: 10,
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
                text: "Nhập lại",
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
                text: "Đồng ý",
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