import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/material.dart';

class AddedPromoItem extends StatelessWidget {
  final VoidCallback onRemoved;
  final EdgeInsets padding;
  final dynamic promotion;

  const AddedPromoItem(
      {Key key,
      this.onRemoved,
      this.padding = const EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.tinySpace,
          bottom: SizeUtil.tinySpace),
      this.promotion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          SvgIcon(
            'ic_discount.svg',
            width: SizeUtil.iconSize,
          ),
          SizedBox(
            width: SizeUtil.smallSpace,
          ),
          Expanded(
              child: RichText(
                  text: TextSpan(children: [
            TextSpan(
              text: promotion == null ? "" : promotion['code'],
              style: TextStyle(
                  color: ColorUtil.textGray,
                  fontSize: SizeUtil.textSizeSmall),
            ),
            TextSpan(
              text: "(${promotion == null ? "" : promotion['title']})",
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontSize: SizeUtil.textSizeSmall),
            )
          ]))),
          ButtonIcon(
            icon: Icon(
              Icons.clear,
              color: ColorUtil.textGray,
            ),
            onPressed: onRemoved,
          )
        ],
      ),
    );
  }
}
