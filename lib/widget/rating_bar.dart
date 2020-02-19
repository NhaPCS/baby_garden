import 'dart:math';

import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingBar extends StatefulWidget {
  final double starSize;
  final bool enable;
  final int value;
  final int rateCount;

  const RatingBar({
    Key key,
    this.starSize = SizeUtil.iconSize,
    this.enable = false,
    this.value = 0,
    this.rateCount = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RatingState();
  }
}

class _RatingState extends State<RatingBar> {
  int _value = 0;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        if (index == 5) {
          return Padding(
            padding: EdgeInsets.only(left: SizeUtil.smallSpace),
            child: Text(
              "(${widget.rateCount.toString()})",
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontSize: SizeUtil.textSizeSmall),
            ),
          );
        }
        return star(index);
      }),
    );
  }

  Widget star(int index) {
    return GestureDetector(
      child: SvgIcon(
        'ic_favorite.svg',
        width: widget.starSize,
        height: widget.starSize,
        color: _value >= index ? null : ColorUtil.lightGray,
      ),
      onTap: () {
        if (!widget.enable) return;
        setState(() {
          _value = index;
        });
      },
    );
  }
}
