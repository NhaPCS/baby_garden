import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton(
      {this.label,
      this.padding,
      this.groupValue,
      this.value,
      this.onChanged,
      this.titleSpace = SizeUtil.tinySpace,
      this.iconSize = SizeUtil.iconMidSize,
      this.iconColor = ColorUtil.primaryColor,
      this.titleSize = SizeUtil.textSizeSmall,
      this.trailing,
      this.titleContent,
        this.subTitle,
      this.crossAxisAlignment = CrossAxisAlignment.center});

  final String label;
  final EdgeInsets padding;
  final int groupValue;
  final int value;
  final Function onChanged;
  final double titleSpace;
  final double iconSize;
  final Color iconColor;
  final double titleSize;
  final Widget trailing;
  final Widget titleContent;
  final Widget subTitle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: crossAxisAlignment,
              children: <Widget>[
                Icon(
                  value != groupValue
                      ? Icons.radio_button_unchecked
                      : Icons.radio_button_checked,
                  size: iconSize,
                  color: iconColor,
                ),
                SizedBox(
                  width: titleSpace,
                ),
                titleContent,
                Spacer(),
                trailing != null ? trailing : SizedBox()
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeUtil.iconSizeBigger,top: subTitle!=null?SizeUtil.tinySpace:0),
              child: subTitle!=null?subTitle:SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
