import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String name;
  final Color color;
  final double width;
  final double height;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  const SvgIcon(
    this.name, {
    Key key,
    this.color,
    this.width,
    this.height,
    this.onPressed,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onPressed == null
        ? svgIcon()
        : InkWell(
            child: svgIcon(),
            onTap: onPressed,
          );
  }

  Widget svgIcon() {
    return Padding(
      padding: padding,
      child: SvgPicture.asset(
        "photo/svg/$name",
        color: color,
        width: width,
        height: height,
      ),
    );
  }
}
