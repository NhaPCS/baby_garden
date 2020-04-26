import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTitleCustom extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget trailing;
  final double iconAndTitleSpace;
  final EdgeInsets padding;
  final Widget content;

  const ListTitleCustom(
      {Key key,
        this.icon,
        this.title,
        this.trailing,
        this.iconAndTitleSpace = SizeUtil.smallSpace,
        this.padding = const EdgeInsets.only(
            left: SizeUtil.normalSpace,
            right: SizeUtil.normalSpace,
            top: SizeUtil.midSmallSpace,
            bottom: SizeUtil.midSmallSpace),
        this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: padding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              icon != null ? icon : SizedBox(),
              SizedBox(
                width: iconAndTitleSpace,
              ),
              Text(title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeExpressTitle,
                      color: Colors.black)),
              Spacer(),
              trailing != null ? trailing : SizedBox(),
            ],
          ),
        ),
        WidgetUtil.getLine(
            color: ColorUtil.lineColor, margin: EdgeInsets.all(0), width: 1),
        content != null ? content : SizedBox(),
        WidgetUtil.getLine(
            color: ColorUtil.lineColor, margin: EdgeInsets.all(0), width: 6),
      ],
    );
  }
}