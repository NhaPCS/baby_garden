import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/checkout/widget/title_icon.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  final String svgIcon;
  final Color iconColor;
  final bool isShowSeparateLine;
  final Widget contentWidget;
  final String content;
  final String contentNote;
  final String title;
  final double iconSize;
  final String trailingText;
  final bool isTrailing;
  final Function onTrailingTap;

  const OrderInfo(
      {this.svgIcon,
      this.iconColor= ColorUtil.primaryColor,
      this.isShowSeparateLine = true,
      this.contentWidget,
      this.content,
      this.contentNote,
      this.title, this.iconSize= SizeUtil.iconSize, this.trailingText, this.isTrailing = false, this.onTrailingTap})
      : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleIcon(
          svgIcon: svgIcon,
          title: title,
          iconColor: iconColor,
          iconSVGSize: iconSize,
          isTrailing: isTrailing,
          trailingText: trailingText,
          onTrailingTap: onTrailingTap,
          titleStyle: TextStyle(
              fontSize: SizeUtil.textSizeExpressTitle, color: Colors.black),
          padding: const EdgeInsets.only(
              left: SizeUtil.normalSpace,
              top: SizeUtil.midSmallSpace,
              bottom: SizeUtil.tinySpace),
        ),
        content!=null?Padding(
          padding: EdgeInsets.only(
              left: SizeUtil.biggerSpace, bottom: SizeUtil.tinySpace),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(content,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                      height: 1.3,
                      color: Colors.black)),
              SizedBox(width: 5,),
              contentNote == null
                  ? SizedBox()
                  : Expanded(child: Text(contentNote,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeSmall,
                      height: 1.3,
                      color: Colors.blue))),
            ],
          ),
        ):SizedBox(),
        contentWidget == null
            ? SizedBox()
            : contentWidget,
        //TODO type of delivery
        isShowSeparateLine
            ? WidgetUtil.getLine(
                width: 1, margin: EdgeInsets.only(top: SizeUtil.tinySpace))
            : SizedBox(),
      ],
    );
  }
}
