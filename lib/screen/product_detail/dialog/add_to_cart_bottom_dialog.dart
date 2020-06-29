import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/product_detail/item/product_horizontal_item.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/screen/product_detail/widget/attached_products.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_close_dialog.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartBottomDialog extends StatelessWidget {
  final dynamic product;

  AddToCartBottomDialog({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> attachedProducts = product['list_product'];
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: SizeUtil.hugSpace,),
              ProductHorizontalItem(
                product: product,
              ),
              AttachedProducts(attachedProducts: attachedProducts,),
              SizedBox(height: SizeUtil.hugSpace,),
            ],
          ),
        ),
        Positioned(
          child: ButtonCloseDialog(),
          right: 0,
          width: 100,
          top: SizeUtil.smallSpace,
        ),
        Positioned(
          right: SizeUtil.defaultSpace,
          left: SizeUtil.defaultSpace,
          child: MyRaisedButton(
            padding: SizeUtil.smallPadding,
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addProduct(product);
              if (attachedProducts != null) {
                attachedProducts.forEach((element) {
                  if (element['checked'] != null && element['checked'])
                    Provider.of<CartProvider>(context, listen: false)
                        .addProduct(element);
                });
              }
              Navigator.of(context).pop();
            },
            icon: SvgIcon(
              'ic_add_cart.svg',
              height: SizeUtil.iconSize,
            ),
            text: S.of(context).add_to_cart,
            textStyle: TextStyle(color: Colors.white),
          ),
          bottom: 0,
        )
      ],
    );
  }
}
