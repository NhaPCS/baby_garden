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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: icon == null
            ? Text(
                text,
                style: textStyle,
              )
            : Wrap(
                spacing: SizeUtil.smallSpace,
                children: <Widget>[
                  icon,
                  Text(
                    text,
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
