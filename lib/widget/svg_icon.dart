import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String name;
  final Color color;
  final double width;
  final double height;

  const SvgIcon(
    this.name, {
    Key key,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "photo/svg/$name",
      color: color,
      width: width,
      height: height,
    );
  }
}
