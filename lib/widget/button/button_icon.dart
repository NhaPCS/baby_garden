import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final Widget icon;
  final double borderRadius;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color borderColor;
  final double borderWidth;
  final Color backgroundColor;

  const ButtonIcon(
      {Key key,
      this.icon,
      this.onPressed,
      this.borderRadius,
      this.padding = SizeUtil.tinyPadding,
      this.borderColor = ColorUtil.primaryColor,
      this.borderWidth = 1,
      this.backgroundColor = ColorUtil.transGray})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: padding,
        child:
            borderRadius == null ? icon : radiusIcon(),
      ),
      onTap: onPressed,
    );
  }

  Widget radiusIcon() {
    return Container(
      child: icon,
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: borderWidth)),
    );
  }
}
