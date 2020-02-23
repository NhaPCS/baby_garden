import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/favorite_product/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class FavoriteProduct extends StatefulWidget {
  @override
  _FavoriteProduct createState() => _FavoriteProduct();
}

class _FavoriteProduct extends BaseState<FavoriteProduct> {
  final GetListProvider _getListProvider = GetListProvider();

  final product = ProductCard(
    image: "photo/sample_product.png",
    description: "Sữa Alene dành cho bé thể tích 320ml...",
    price: "900000",
    datetime: "13/2/2020",
    favorite: true,
  );

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).favoriteProduct),
        body: Column(children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[product, product, product],
            ),
          ),
        ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
