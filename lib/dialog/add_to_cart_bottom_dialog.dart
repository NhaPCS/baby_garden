import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_product_horizontal.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_close_dialog.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartBottomDialog extends StatelessWidget {
  final dynamic product;
  ValueNotifier<int> quantityController = ValueNotifier(1);

  AddToCartBottomDialog({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ButtonCloseDialog(),
        ItemProductHorizontal(
          product: product,
          quantityController: quantityController,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
              left: SizeUtil.defaultSpace, right: SizeUtil.defaultSpace),
          child: MyRaisedButton(
            padding: SizeUtil.smallPadding,
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).addProduct(product);
              Navigator.of(context).pop();
            },
            icon: SvgIcon(
              'ic_add_cart.svg',
              height: SizeUtil.iconSize,
            ),
            text: S.of(context).add_to_cart,
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
