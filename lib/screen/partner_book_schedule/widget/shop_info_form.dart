import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';

class ShopInfoForm extends StatelessWidget{
  final String title;
  final String content;
  final Color contentColor;
  final bool isExpanded;

  const ShopInfoForm({this.title, this.content, this.contentColor = ColorUtil.textColor, this.isExpanded = true}):super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isExpanded?Expanded(
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
            text: title,
            style: TextStyle(
                color: ColorUtil.textColor,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: " " + content,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                      color: contentColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal)),
            ]),
      ),
    ):RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
          text: title,
          style: TextStyle(
              color: ColorUtil.textColor,
              fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
                text: " " + content,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeSmall,
                    color: contentColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal)),
          ]),
    );
  }

}