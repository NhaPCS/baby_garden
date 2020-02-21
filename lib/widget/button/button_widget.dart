import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsets padding;
  final bool matchParent;
  final Widget leading;

  const ButtonWidget(
      {Key key,
      this.onPressed,
      @required this.text,
      this.textStyle,
      this.backgroundColor,
      this.borderColor,
      this.borderRadius = 0,
      this.borderWidth = 1.0,
      this.padding = SizeUtil.smallPadding,
      this.matchParent = true,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (matchParent)
      return ButtonTheme(
        minWidth: double.infinity,
        child: _childButton(),
      );
    else
      return _childButton();
  }

  Widget _childButton() {
    if (borderColor != null) {
      return new OutlineButton(
          child: _child(),
          color: backgroundColor,
          disabledTextColor: borderColor,
          highlightColor: borderColor,
          padding: padding,
          onPressed: onPressed,
          borderSide: BorderSide(width: borderWidth, color: borderColor),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(borderRadius)));
    } else
      return _flatButton();
  }

  Widget _flatButton() {
    return FlatButton(
        onPressed: onPressed,
        color: backgroundColor,
        padding: padding,
        child: _child());
  }

  Widget _child() {
    if (leading != null) {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: SizeUtil.tinySpace,
        children: <Widget>[leading, _text()],
      );
    } else
      return _text();
  }

  Widget _text() {
    return Text(
      text,
      style: textStyle,
      maxLines: 1,
    );
  }
}
