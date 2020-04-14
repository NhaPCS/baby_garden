import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/material.dart';

class ItemOrderOption extends StatelessWidget {
  final dynamic option;

  const ItemOrderOption({Key key, @required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(1),
      padding: SizeUtil.smallPadding,
      child: Column(
        children: <Widget>[
          Expanded(child: SvgIcon("${option['icon']}.svg")),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Text(
            option['title'],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: SizeUtil.textSizeSmall),
          )
        ],
      ),
      color: Color(0xffFBFBFB),
    );
  }
}
