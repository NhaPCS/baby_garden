import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class FavoriteTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: SizeUtil.tinySpace,
        children: <Widget>[
          Icon(
            Icons.done,
            color: Colors.white,
            size: SizeUtil.iconSize,
          ),
          Text(
            S.of(context).favorite,
            style: TextStyle(
                color: Colors.white, fontSize: SizeUtil.textSizeSmall),
          )
        ],
      ),
      padding: EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.tinySpace,
          bottom: SizeUtil.tinySpace),
      decoration: BoxDecoration(
          color: ColorUtil.primaryColor,
          borderRadius: BorderRadius.circular(SizeUtil.tinyRadius)),
    );
  }
}
