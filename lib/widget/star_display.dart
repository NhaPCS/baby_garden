
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final int value;
  final Color bgColor;

  final double size;

  const StarDisplay({Key key,
    this.value = 0,
    this.bgColor = ColorUtil.primaryColor,
    this.size = SizeUtil.iconSizeDefault})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: bgColor,
          size: size,
        );
      }),
    );
  }
}