import 'package:baby_garden_flutter/item/item_product.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/product/view_more_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatelessWidget {
  final EdgeInsets padding;
  final int maxItems;
  final VoidCallback onViewMoreClick;
  final int rowsCount;

  const ListProduct(
      {Key key,
      this.padding = const EdgeInsets.all(0),
      this.maxItems,
      this.onViewMoreClick,
      this.rowsCount = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.lineColor,
      padding: padding,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: maxItems != null ? maxItems : 5,
        itemBuilder: (context, index) {
          if (maxItems != null && index == maxItems - 1) {
            return ViewMoreProduct();
          } else
            return ItemProduct(
              index: index,
            );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowsCount, childAspectRatio: 1.3),
      ),
      height: Provider.of<AppProvider>(context).productHeight * rowsCount,
    );
  }
}
