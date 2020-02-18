import 'package:baby_garden_flutter/item/item_product.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.lineColor,
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
