import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscountNote extends StatelessWidget {
  final String note;

  const DiscountNote({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (note == null) return SizedBox(height: SizeUtil.tinySpace,);
    return Padding(
      padding: SizeUtil.tinyPadding,
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.angleDoubleLeft,
            size: SizeUtil.iconSizeSmall,
            color: ColorUtil.blueLight,
          ),
          SizedBox(
            width: SizeUtil.tinySpace,
          ),
          Expanded(
              child: MyText(
            note,
            style: TextStyle(
                color: ColorUtil.blueLight, fontSize: SizeUtil.textSizeSmall),
          ))
        ],
      ),
    );
  }
}
