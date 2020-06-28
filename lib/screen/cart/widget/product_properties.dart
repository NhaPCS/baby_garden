import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';

class ProductProperties extends StatelessWidget {
  final dynamic product;

  const ProductProperties({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (product['color_name'] != null || product['size_name'] != null) {
      return Padding(
        padding: EdgeInsets.only(
            top: SizeUtil.tinySpace, bottom: SizeUtil.tinySpace),
        child: Row(
          children: <Widget>[
            Text(
              "${S.of(context).color}: ",
              style: TextStyle(fontSize: SizeUtil.textSizeSmall),
            ),
            MyText(
              product['color_name'],
              style: TextStyle(
                  color: ColorUtil.blue, fontSize: SizeUtil.textSizeSmall),
            ),
            SizedBox(
              width: SizeUtil.defaultSpace,
            ),
            Text("${S.of(context).size}: ",
                style: TextStyle(fontSize: SizeUtil.textSizeSmall)),
            MyText(
              product['size_name'],
              style: TextStyle(
                  color: ColorUtil.blue, fontSize: SizeUtil.textSizeSmall),
            ),
          ],
        ),
      );
    }
    return SizedBox();
  }
}
