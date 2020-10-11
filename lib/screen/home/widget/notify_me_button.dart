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
    bool isRemind = product['is_remind'] != null && product['is_remind'].toString() == '1';
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          !isRemind ? S.of(context).notify_me : S.of(context).delete_notify_me,
          style: TextStyle(
              fontSize: SizeUtil.textSizeTiny,
              color: isRemind ? ColorUtil.textColor : Colors.white,
              fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            color: !isRemind
                ? ColorUtil.primaryColor.withOpacity(0.8)
                : ColorUtil.white.withOpacity(0.7),
            borderRadius: new BorderRadius.circular(SizeUtil.tinyRadius),
            border: Border.all(
                color:
                    isRemind ? ColorUtil.textColor : ColorUtil.primaryColor)),
        padding: SizeUtil.tinyPadding,
      ),
      onTap: onNotifyMePressed,
    );
  }
}
