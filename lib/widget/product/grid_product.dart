import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:baby_garden_flutter/widget/product/list_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridProduct extends StatelessWidget {
  final VoidCallback onViewMoreClick;
  final double categoryWidth;
  final double categoryHeight;
  final double productHeight;
  final double productWidth;

  const GridProduct(
      {Key key,
      this.onViewMoreClick,
      @required this.categoryWidth,
      @required this.categoryHeight,
      @required this.productHeight,
      @required this.productWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: SizeUtil.smallSpace,
            ),
            Expanded(
                child: Text(
              "Sữa cho bé".toUpperCase(),
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtil.textSizeBigger),
            )),
            InkWell(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Text(
                    S.of(context).view_more,
                    style: TextStyle(color: ColorUtil.primaryColor),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: ColorUtil.primaryColor,
                    size: SizeUtil.iconSizeBigger,
                  )
                ],
              ),
              onTap: onViewMoreClick,
            )
          ],
        ),
        SizedBox(
          height: SizeUtil.smallSpace,
        ),
        ListCategory(
          categoryWidth: categoryWidth,
          categoryHeight: categoryHeight,
        ),
        ListProduct(
          productWidth: productWidth,
          productHeight: productHeight,
        ),
        ListProduct(
          productWidth: productWidth,
          productHeight: productHeight,
        )
      ],
    );
  }
}
