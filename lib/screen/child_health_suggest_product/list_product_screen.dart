import 'package:baby_garden_flutter/item/product_item.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class ChildHealthSuggestProductsScreen extends StatefulWidget {
  final List<dynamic> products;
  final String title;

  const ChildHealthSuggestProductsScreen({Key key, this.products, this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListProductState();
  }
}

class _ListProductState extends BaseState<ChildHealthSuggestProductsScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: widget.title, upperCase: true),
      body: GridView.builder(
        itemCount: widget.products == null ? 0 : widget.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        padding: EdgeInsets.only(
            left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
        itemBuilder: (context, index) {
          return ProductItem(
            product: widget.products[index],
            index: index,
            width: MediaQuery.of(context).size.width * 0.5,
            borderRadius: SizeUtil.tinyRadius,
            nameStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
            padding: EdgeInsets.only(
                left: SizeUtil.smallSpace, right: SizeUtil.smallSpace, top: 0),
          );
        },
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
