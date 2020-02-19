import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_product_horizontal.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button_icon.dart';
import 'package:baby_garden_flutter/widget/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/material.dart';

class AddToCartBottomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: SizeUtil.smallPadding,
            child: ButtonIcon(
              backgroundColor: ColorUtil.lightGray,
              borderRadius: 20,
              padding: EdgeInsets.all(3),
              icon: Icon(
                Icons.close,
                color: ColorUtil.primaryColor,
                size: SizeUtil.iconSize,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            alignment: Alignment.centerRight,
          ),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ItemProductHorizontal(),
              ItemProductHorizontal(
                isAttach: true,
              ),
            ],
          )),
          MyRaisedButton(
            onPressed: () {},
            icon: SvgIcon(
              'ic_add_cart.svg',
              height: SizeUtil.iconSize,
            ),
            text: S.of(context).add_to_cart,
            textStyle: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
