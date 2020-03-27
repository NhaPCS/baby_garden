import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_category_provider.dart';
import 'package:baby_garden_flutter/screen/list_product/list_product_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:baby_garden_flutter/widget/product/list_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridProduct extends StatelessWidget {
  final bool isHome;
  final String title;

  const GridProduct({
    Key key,
    @required this.title,
    this.isHome = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
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
                title.toUpperCase(),
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtil.textSizeBigger),
              )),
              Wrap(
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
              )
            ],
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          ListCategory(),
          ListProduct(
            maxItems: isHome ? 8 : 16,
            rowsCount: isHome ? 1 : 2,
          ),
        ],
      ),
      onTap: () {
        RouteUtil.push(
            context,
            ListProductScreen(
              title: title,
            ));
      },
    );
  }
}
