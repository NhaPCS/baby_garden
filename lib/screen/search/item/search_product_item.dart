import 'dart:math';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';

class SearchProductItem extends StatelessWidget {
  final dynamic product;
  final bool isPickup;

  const SearchProductItem({Key key, this.product, this.isPickup = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: MyText(
                product['name'],
              )),
              Text(
                StringUtil.getPriceText(product['price_discount']),
                style: TextStyle(color: ColorUtil.red),
              )
            ],
          ),
          trailing: Transform.rotate(
            angle: -180 * pi / 360,
            alignment: Alignment.center,
            child: Icon(
              Icons.call_made,
              color: ColorUtil.gray,
            ),
          ),
          subtitle: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: S.of(context).distributor_name,
                style: TextStyle(color: ColorUtil.textGray)),
            TextSpan(
                text: product['shop_name'],
                style: TextStyle(color: ColorUtil.blue)),
          ])),
          onTap: () {
            if (isPickup != null && isPickup) {
              Navigator.of(context).pop(product);
              return;
            }
            RouteUtil.push(
                context,
                ProductDetailScreen(
                  productId: product['id'],
                ));
          },
        ),
        WidgetUtil.getLine(
            margin: EdgeInsets.only(
                left: SizeUtil.defaultSpace, right: SizeUtil.defaultSpace))
      ],
    );
  }
}
