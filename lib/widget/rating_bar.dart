import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  final double starSize;
  final bool enable;
  final int value;
  final int rateCount;
  final bool isIcon;
  final bool showRateCount;
  final Color iconColor;
  final Function onChange;
  final MainAxisAlignment alignment;

  const RatingBar({
    Key key,
    this.starSize = SizeUtil.iconSize,
    this.enable = false,
    this.value = 0,
    this.rateCount = 0,
    this.isIcon = false,
    this.showRateCount = true,
    this.iconColor = ColorUtil.primaryColor,
    this.alignment = MainAxisAlignment.center, this.onChange
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
      mainAxisAlignment: widget.alignment,
      children: List.generate(widget.showRateCount ? 6 : 5, (index) {
        if (widget.showRateCount && index == 5) {
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
      child: widget.isIcon
          ? Icon(
              index < _value ? Icons.star : Icons.star_border,
              size: widget.starSize,
              color: widget.iconColor,
            )
          : SvgIcon(
              'ic_favorite.svg',
              width: widget.starSize,
              height: widget.starSize,
              color: _value > index ? null : ColorUtil.lightGray,
            ),
      onTap: () {
        if (!widget.enable) return;
        setState(() {
          _value = index + 1;
          if(widget.onChange!=null){
            widget.onChange(_value);
          }
        });
      },
    );
  }
}
