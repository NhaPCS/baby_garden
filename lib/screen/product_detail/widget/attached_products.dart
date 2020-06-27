import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/product_detail/item/product_horizontal_item.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class AttachedProducts extends StatelessWidget {
  final List<dynamic> attachedProducts;

  const AttachedProducts({Key key, this.attachedProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (attachedProducts != null && attachedProducts.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: SizeUtil.defaultSpace),
            child: Text(
              S.of(context).attached_product,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          WidgetUtil.getLine(),
          Column(
            children: attachedProducts
                .map((e) => ProductHorizontalItem(
                      product: e,
                      isAttach: true,
                    ))
                .toList(),
          )
        ],
      );
    }
    return SizedBox();
  }
}
