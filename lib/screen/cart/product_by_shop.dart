import 'package:baby_garden_flutter/item/item_product_cart.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/circle_checkbox.dart';
import 'package:flutter/material.dart';

class ProductByShop extends StatelessWidget {
  final dynamic shop;

  const ProductByShop({Key key, this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleCheckbox(
          text: Text(
            shop['shop_name'],
            style: TextStyle(
                color: ColorUtil.textGray, fontWeight: FontWeight.bold),
          ),
          checkBg: Icons.radio_button_checked,
          uncheckBg: Icons.radio_button_unchecked,
          color: ColorUtil.primaryColor,
          activeColor: ColorUtil.primaryColor,
        ),
        WidgetUtil.getLine(
            margin: EdgeInsets.only(top: 0, bottom: SizeUtil.smallSpace)),
        Column(
            children: List.generate(
                shop['product'].length,
                (index) => ItemProductCart(
                      hasDashLine: index < shop['product'].length - 1,
                      product: shop['product'][index],
                    ))),
        WidgetUtil.getLine(margin: EdgeInsets.all(0), width: 5)
      ],
    );
  }
}
