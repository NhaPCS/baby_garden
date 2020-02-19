import 'package:baby_garden_flutter/item/item_product.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatelessWidget {
  final EdgeInsets padding;

  const ListProduct({Key key, this.padding = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.lineColor,
      padding: padding,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ItemProduct();
        },
        scrollDirection: Axis.horizontal,
      ),
      height: Provider.of<AppProvider>(context).productHeight,
    );
  }
}
