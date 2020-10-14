import 'package:baby_garden_flutter/item/product_item.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/product/list_category.dart';
import 'package:flutter/material.dart';

class ShopProductContent extends StatelessWidget {
  final List<dynamic> products;
  final ValueChanged<dynamic> onChangedCategory;

  const ShopProductContent({Key key, this.products, this.onChangedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListCategory(
          onChangedCategory: (category) {
            onChangedCategory(category);
          },
        ),
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.78),
            padding: EdgeInsets.only(
                top: SizeUtil.tinySpace,
                left: SizeUtil.tinySpace,
                right: SizeUtil.tinySpace),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductItem(
                product: products[index],
                width: MediaQuery.of(context).size.width * 0.5,
                borderRadius: SizeUtil.tinyRadius,
                showSoldCount: false,
                nameStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                padding: EdgeInsets.only(
                    left: SizeUtil.smallSpace,
                    right: SizeUtil.smallSpace,
                    top: 0),
              );
            },
          ),
          color: ColorUtil.lineColor,
        )
      ],
    );
  }
}
