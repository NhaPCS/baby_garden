import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/material.dart';

class ItemAddedPromo extends StatelessWidget {
  final VoidCallback onRemoved;
  final EdgeInsets padding;

  const ItemAddedPromo({Key key, this.onRemoved,this.padding= const EdgeInsets.only(
      left: SizeUtil.smallSpace,
      right: SizeUtil.smallSpace,
      top: SizeUtil.tinySpace,
      bottom: SizeUtil.tinySpace)}) : super(key: key);

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
              text: "VCB100k",
              style: TextStyle(
                  color: ColorUtil.textGray, fontSize: SizeUtil.textSizeSmall),
            ),
            TextSpan(
              text: "(giảm giá 100.000 trên tổng đơn hàng)",
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
