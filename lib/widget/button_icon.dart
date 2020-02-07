import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final Text text;
  final Icon icon;
  final VoidCallback onPressed;

  const ButtonIcon({Key key, this.text, this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: SizeUtil.smallPadding,
        child: text != null ? text : icon,
      ),
      onTap: onPressed,
    );
  }
}
