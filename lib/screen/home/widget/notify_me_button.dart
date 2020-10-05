import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class NotifyMeButton extends StatelessWidget {
  final dynamic product;
  final VoidCallback onNotifyMePressed;

  const NotifyMeButton(
      {Key key, @required this.product, @required this.onNotifyMePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          S.of(context).notify_me,
          style: TextStyle(
              fontSize: SizeUtil.textSizeTiny, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          color: ColorUtil.primaryColor.withOpacity(0.8),
            borderRadius: new BorderRadius.circular(SizeUtil.tinyRadius),
            border: Border.all(color: ColorUtil.primaryColor)),
        padding: SizeUtil.tinyPadding,
      ),
      onTap: onNotifyMePressed,
    );
  }
}
