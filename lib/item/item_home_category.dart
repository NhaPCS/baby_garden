import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class ItemHomeCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: SizeUtil.normalPadding,
      child: Column(
        children: <Widget>[
          Image.asset(
            'photo/ic_category.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Text(
            S.of(context).category,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorUtil.primaryColor, fontSize: SizeUtil.textSizeTiny),
          )
        ],
      ),
    ));
  }
}
