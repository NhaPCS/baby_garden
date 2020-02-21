import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class ImageCount extends StatelessWidget {
  final String text;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;

  const ImageCount(
      {Key key,
      this.text,
      this.margin = SizeUtil.smallPadding,
      this.padding = const EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.tinySpace,
          bottom: SizeUtil.tinySpace),
      this.backgroundColor = ColorUtil.transGray})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text == null ? "" : text,
        style: TextStyle(color: ColorUtil.primaryColor),
      ),
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: ColorUtil.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(SizeUtil.smallRadius)),
    );
  }
}
