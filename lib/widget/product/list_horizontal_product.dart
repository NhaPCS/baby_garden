import 'package:baby_garden_flutter/item/product_item.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/product/view_more_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListHorizontalProduct extends StatelessWidget {
  final EdgeInsets padding;
  final int maxItems;
  final VoidCallback onViewMoreClick;
  final int rowsCount;
  final List<dynamic> products;

  const ListHorizontalProduct(
      {Key key,
      this.padding = const EdgeInsets.all(0),
      this.maxItems,
      this.onViewMoreClick,
      this.rowsCount = 1,
      this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.lineColor,
      padding: padding,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getItemsCount(),
        itemBuilder: (context, index) {
          if (maxItems != null && index == maxItems - 1) {
            return ViewMoreProduct();
          } else
            return ProductItem(
              index: index,
              product: products == null ? null : products[index],
            );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowsCount, childAspectRatio: 1.3),
      ),
      height: Provider.of<AppProvider>(context).productHeight * rowsCount,
    );
  }

  int getItemsCount() {
    if (products != null) {
      if (maxItems != null && products.length > maxItems)
        return maxItems;
      else
        return products.length;
    }
    return 0;
  }
}
