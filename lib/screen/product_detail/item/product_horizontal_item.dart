import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/cart/select_product_property.dart';
import 'package:baby_garden_flutter/widget/change_quantity_widget.dart';
import 'package:baby_garden_flutter/widget/checkbox/circle_checkbox.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductHorizontalItem extends StatelessWidget {
  final bool isAttach;
  final dynamic product;
  final ValueNotifier<int> quantityController;

  const ProductHorizontalItem(
      {Key key, this.isAttach = false, this.product, this.quantityController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isAttach
                ? CircleCheckbox(
                    padding: SizeUtil.tinyPadding,
                    color: ColorUtil.textGray,
                    checkBg: Icons.check_box,
                    uncheckBg: Icons.crop_square,
                  )
                : SizedBox(
                    width: SizeUtil.smallSpace,
                  ),
            CircleImage(
              imageUrl: product['image'] == null || product['image'].isEmpty
                  ? ""
                  : product['image'][0],
              borderRadius: SizeUtil.smallRadius,
              width: Provider.of<AppProvider>(context).productCartWidth,
              height: Provider.of<AppProvider>(context).productCartHeight,
            ),
            SizedBox(
              width: SizeUtil.smallSpace,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText(
                  product['name'],
                  style: TextStyle(
                      color: ColorUtil.textGray, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      StringUtil.getPriceText(product['price_discount']),
                      style: TextStyle(
                          color: ColorUtil.red, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: SizeUtil.smallSpace,
                    ),
                    Text(
                      StringUtil.getPriceText(product['price']),
                      style: TextStyle(
                          fontSize: SizeUtil.textSizeSmall,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(S.of(context).product_count),
                    ChangeQuantityWidget(
                      height: 28,
                      textColor: ColorUtil.primaryColor,
                      quantityChanged: (value) {
                      product['quantity'] = value;
                      },
                    )
                  ],
                )
              ],
            )),
          ],
        ),
        WidgetUtil.getLine(
          width: 2,
        ),
        SelectProductProperty(
          title: S.of(context).size,
          product: product,
          property: 'size',
        ),
        SelectProductProperty(
          title: S.of(context).color,
          product: product,
          property: 'color',
        ),
        WidgetUtil.getLine(width: 3)
      ],
    );
  }
}
