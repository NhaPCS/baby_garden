import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class PaddingText extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Text text;
  final VoidCallback onPressed;

  const PaddingText(
      {Key key,
      this.padding = SizeUtil.smallPadding,
      this.text,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: padding,
        child: text,
      ),
      onTap: onPressed,
    );
  }
}
