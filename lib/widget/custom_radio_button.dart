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
      this.iconColor = ColorUtil.primaryColor,this.titleSize = SizeUtil.textSizeSmall,this.trailing});

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
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
            Text(label,style: TextStyle(fontSize: titleSize),),
            Spacer(),
            trailing!=null?trailing:SizedBox()
          ],
        ),
      ),
    );
  }
}
