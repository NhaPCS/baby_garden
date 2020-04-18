import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final String text;
  final TextStyle textStyle;
  final Color color;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Widget icon;
  final double elevation;
  final bool matchParent;

  const MyRaisedButton(
      {Key key,
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
      this.elevation,
      this.borderWidth = 0,
      this.borderColor = Colors.transparent,
      this.matchParent = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
        color: color,
        elevation: elevation,
        onPressed: onPressed,
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
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor, width: borderWidth)),
      ),
      minWidth: matchParent ? double.infinity : 0,
      height: 0,
      padding: padding,
    );
  }
}
