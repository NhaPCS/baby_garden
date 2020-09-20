import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final String text;
  final TextStyle textStyle;
  final Color color;
  final double borderRadius;
  final double height;
  final Widget icon;

  const MyFlatButton({
    Key key,
    @required this.onPressed,
    this.text,
    this.padding = const EdgeInsets.only(
        left: SizeUtil.defaultSpace,
        right: SizeUtil.defaultSpace,
        top: 8,
        bottom: 8),
    this.color,
    this.borderRadius = SizeUtil.smallRadius,
    this.textStyle,
    this.icon,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: height,
        child: icon == null
            ? Text(
                text,
                style: textStyle,
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  icon,
                  SizedBox(
                    width: SizeUtil.smallSpace,
                  ),
                  AutoSizeText(
                    text,
                    maxFontSize: SizeUtil.textSizeDefault,
                    minFontSize: SizeUtil.textSizeSmall,
                    style: textStyle,
                  )
                ],
              ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: new BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      onTap: onPressed,
    );
  }
}
