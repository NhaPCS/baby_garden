import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class ChipTag extends StatefulWidget {
  final String text;
  final Color fillColor;
  final Color borderColor;
  final Color selectedBorderColor;
  final double borderRadius;
  final bool hasCheckable;
  final ValueChanged<bool> onChanged;
  final bool removable;
  final VoidCallback onRemoveItem;
  final double textSize;

  const ChipTag(
      {Key key,
      this.text,
      this.fillColor = Colors.transparent,
      this.borderColor = ColorUtil.textGray,
      this.borderRadius = SizeUtil.smallRadius,
      this.selectedBorderColor = ColorUtil.primaryColor,
      this.hasCheckable = false,
      this.onChanged,
      this.removable = false,
      this.onRemoveItem,
      this.textSize = SizeUtil.textSizeSmall})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChipState();
  }
}

class _ChipState extends State<ChipTag> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: widget.removable
            ? Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  getText(),
                  InkWell(
                    child: Padding(
                      padding: SizeUtil.tinyPadding,
                      child: Icon(
                        Icons.clear,
                        size: SizeUtil.iconSize,
                        color: ColorUtil.textGray,
                      ),
                    ),
                    onTap: () {
                      if (widget.onRemoveItem != null) widget.onRemoveItem();
                    },
                  ),
                ],
              )
            : getText(),
        margin: EdgeInsets.only(
            top: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
        padding: EdgeInsets.only(
            left: SizeUtil.smallSpace,
            right: SizeUtil.smallSpace,
            top: SizeUtil.tinySpace,
            bottom: SizeUtil.tinySpace),
        decoration: BoxDecoration(
            color: widget.fillColor,
            border: Border.all(
                color: selected && widget.hasCheckable
                    ? widget.selectedBorderColor
                    : widget.borderColor),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius))),
      ),
      onTap: () {
        if (widget.hasCheckable)
          setState(() {
            selected = !selected;
            widget.onChanged(selected);
          });
      },
    );
  }

  Widget getText() {
    return Text(
      widget.text,
      style: widget.hasCheckable
          ? TextStyle(
              color: selected ? widget.selectedBorderColor : widget.borderColor,
              fontSize: widget.textSize)
          : TextStyle(fontSize: widget.textSize),
    );
  }
}
