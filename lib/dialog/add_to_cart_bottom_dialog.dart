import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_product_horizontal.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_close_dialog.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
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
          ButtonCloseDialog(),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ItemProductHorizontal(),
              WidgetUtil.paddingWidget(
                  Text(
                    S.of(context).attached_product,
                    style: TextStyle(
                        color: ColorUtil.textGray, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.only(
                      left: SizeUtil.smallSpace,
                      right: SizeUtil.smallSpace,
                      bottom: SizeUtil.smallSpace)),
              ItemProductHorizontal(
                isAttach: true,
              ),
            ],
          )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                left: SizeUtil.defaultSpace, right: SizeUtil.defaultSpace),
            child: MyRaisedButton(
              padding: SizeUtil.smallPadding,
              onPressed: () {},
              icon: SvgIcon(
                'ic_add_cart.svg',
                height: SizeUtil.iconSize,
              ),
              text: S.of(context).add_to_cart,
              textStyle: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
