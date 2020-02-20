import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

import 'button_icon.dart';

class ButtonCloseDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SizeUtil.smallPadding,
      child: ButtonIcon(
        backgroundColor: ColorUtil.lightGray,
        borderRadius: 20,
        padding: EdgeInsets.all(3),
        icon: Icon(
          Icons.close,
          color: ColorUtil.primaryColor,
          size: SizeUtil.iconSize,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      alignment: Alignment.centerRight,
    );
  }
}
